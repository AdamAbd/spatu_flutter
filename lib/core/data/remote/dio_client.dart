import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:spatu_flutter/core/core.dart';

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

        // CustomInterceptor()
      ]);
  }
}

// class CustomInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     final userToken = sl<UserCubit>().state.token;

//     if (userToken != null) {
//       options.headers.addAll({
//         'Authorization': 'Bearer ' + userToken,
//       });
//     }

//     super.onRequest(options, handler);
//   }
// }
