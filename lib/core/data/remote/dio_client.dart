import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

// ignore: avoid_classes_with_only_static_members
class DioClient {
  static Dio dioInit() {
    return Dio()
      ..options = BaseOptions(
        headers: {
          'Accept': 'application/json',
        },
        connectTimeout: DurationConstant.networkConnectTimeout,
        sendTimeout: DurationConstant.networkSendTimeout,
        receiveTimeout: DurationConstant.networkReceiveTimeout,
      )
      ..interceptors.addAll([
        /// Show log network request in debug console [only in debug mode]
        if (kDebugMode)
          LogInterceptor(
            requestBody: true,
            responseBody: true,
            logPrint: (message) => log(message.toString()),
          ),

        CustomInterceptor()
      ]);
  }
}

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final userCubit = sl<UserCubit>().state;

    if (options.path.contains("logout") != true &&
        userCubit.accessToken?.isNotEmpty == true) {
      options.headers
          .addAll({"Authorization": "Bearer ${userCubit.accessToken}"});
    }

    if (options.path.contains("logout") &&
        userCubit.refreshToken?.isNotEmpty == true) {
      final String rawCookie = userCubit.refreshToken!;
      final int index = rawCookie.indexOf(';');
      final String refreshToken =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
      final int idx = refreshToken.indexOf("=");
      final List<String> splitTkn =
          refreshToken.substring(idx + 1).trim().split('%7C');

      options.headers
          .addAll({"Authorization": "Bearer ${splitTkn[0]}|${splitTkn[1]}"});
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError

    if (err.response?.statusCode == 401) {
      final Dio dio = Dio();

      final userCubit = sl<UserCubit>();
      final String rawCookie = userCubit.state.refreshToken!;
      final int index = rawCookie.indexOf(';');
      final String refreshToken =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
      final int idx = refreshToken.indexOf("=");
      final List<String> splitToken =
          refreshToken.substring(idx + 1).trim().split('%7C');

      print(
        'Ini dari ErrorInterceptor Dio = ${splitToken[0]}|${splitToken[1]}',
      );

      dio
          .post(
        UrlConstant.refreshToken,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${splitToken[0]}|${splitToken[1]}'
          },
        ),
      )
          .then((value) async {
        if (value.statusCode == 201) {
          //get new tokens ...
          print(
            "Token baru dari refresh token " + value.data['data'].toString(),
          );

          userCubit.saveToken(
            refreshToken: rawCookie,
            accessToken: value.data['data'].toString(),
          );

          //set bearer
          err.requestOptions.headers["Authorization"] =
              "Bearer ${value.data['data'].toString()}";

          //create request with new access token
          final opts = Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          );

          final cloneReq = await dio.request(
            err.requestOptions.path,
            options: opts,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );

          print("Ini dionya udh selesai dam");

          return handler.resolve(cloneReq);
        } else {
          super.onError(err, handler);
        }
      });
    } else {
      super.onError(err, handler);
    }
  }
}
