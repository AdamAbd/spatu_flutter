import 'package:dio/dio.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class AuthRemoteDataSource with BaseDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<BaseApiResponseModel<UserDataModel>> login({
    required String email,
    required String password,
  }) async {
    return dioCatchOrThrow(() async {
      final response = await dio.post(
        UrlConstant.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      final userCubit = sl<UserCubit>();

      if (response.data != null && response.headers['set-cookie'] != null) {
        userCubit.saveToken(
          accessToken: response.data['data']['access_token'].toString(),
          refreshToken: response.headers['set-cookie'].toString(),
        );
      }

      return BaseApiResponseModel.fromJson(
        response.data as Map<String, dynamic>,
        generatedData: (data) {
          return UserDataModel.fromJson(data as Map<String, dynamic>);
        },
      );
    });
  }

  Future<BaseApiResponseModel<String>> register({
    required String username,
    required String email,
    required String password,
  }) async {
    return dioCatchOrThrow(() async {
      final response = await dio.post(
        UrlConstant.register,
        data: {
          'username': username,
          'email': email,
          'password': password,
        },
      );

      return BaseApiResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    });
  }

  Future<BaseApiResponseModel<UserDataModel>> verifyEmail({
    required int code,
  }) async {
    return dioCatchOrThrow(() async {
      final response = await dio.post(
        UrlConstant.verify,
        data: {
          'code': code,
          'type': 'email',
        },
      );

      final userCubit = sl<UserCubit>();

      if (response.data != null && response.headers['set-cookie'] != null) {
        userCubit.saveToken(
          accessToken: response.data['data']['access_token'].toString(),
          refreshToken: response.headers['set-cookie'].toString(),
        );
      }

      return BaseApiResponseModel.fromJson(
        response.data as Map<String, dynamic>,
        generatedData: (data) {
          return UserDataModel.fromJson(data as Map<String, dynamic>);
        },
      );
    });
  }

  Future<BaseApiResponseModel<String>> resend({
    required String type,
    required String email,
  }) async {
    return dioCatchOrThrow(() async {
      final response = await dio.post(
        UrlConstant.resendCode,
        data: {
          'type': type,
          'email': email,
        },
      );

      return BaseApiResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    });
  }

  Future<BaseApiResponseModel<String>> sendReset({
    required String email,
  }) async {
    return dioCatchOrThrow(() async {
      final response = await dio.put(
        UrlConstant.sendReset,
        data: {
          'email': email,
        },
      );

      return BaseApiResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    });
  }

  Future<BaseApiResponseModel<String>> verifyReset({
    required int code,
  }) async {
    return dioCatchOrThrow(() async {
      final response = await dio.post(
        UrlConstant.verify,
        data: {
          'code': code,
          'type': 'reset',
        },
      );

      return BaseApiResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    });
  }

  Future<BaseApiResponseModel<String>> resetPassword({
    required int code,
    required String password,
    required String passwordConfirmation,
  }) async {
    return dioCatchOrThrow(() async {
      final response = await dio.put(
        UrlConstant.resetPassword,
        data: {
          'code': code,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );

      return BaseApiResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    });
  }

  Future<BaseApiResponseModel<UserDataModel>> googleLogin({
    required String username,
    required String email,
    required String avatar,
    required String googleId,
  }) async {
    return dioCatchOrThrow(() async {
      final response = await dio.post(
        UrlConstant.google,
        data: {
          'username': username,
          'email': email,
          'avatar': avatar,
          'google_id': googleId,
        },
      );

      final userCubit = sl<UserCubit>();

      if (response.data != null && response.headers['set-cookie'] != null) {
        userCubit.saveToken(
          accessToken: response.data['data']['access_token'].toString(),
          refreshToken: response.headers['set-cookie'].toString(),
        );
      }

      return BaseApiResponseModel.fromJson(
        response.data as Map<String, dynamic>,
        generatedData: (data) {
          return UserDataModel.fromJson(data as Map<String, dynamic>);
        },
      );
    });
  }

  Future<BaseApiResponseModel<String>> logout() async {
    return dioCatchOrThrow(() async {
      final response = await dio.post(UrlConstant.logout);

      return BaseApiResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    });
  }
}
