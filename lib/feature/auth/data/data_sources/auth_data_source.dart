import 'package:dio/dio.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

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

  Future<BaseApiResponseModel<String>> reset({
    required String email,
  }) async {
    return dioCatchOrThrow(() async {
      final response = await dio.put(
        UrlConstant.resetPassword,
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

  // Future<BaseApiResponseModel<UserModel>> loginGoogle({
  //   String? googleId,
  //   String? email,
  //   String? username,
  //   String? picturePath,
  //   String? ipAddress,
  // }) async {
  //   return dioCatchOrThrow(() async {
  //     var response = await dio.post(UrlConstant.loginGoogle, data: {
  //       'google_id': googleId,
  //       'email': email,
  //       'username': username,
  //       'picture_path': picturePath,
  //       'ip_address': ipAddress,
  //     });

  //     return BaseApiResponseModel.fromJson(
  //       response.data as Map<String, dynamic>,
  //       keyData: 'user',
  //       generatedData: (data) {
  //         return UserModel.fromJson(data as Map<String, Object?>);
  //       },
  //     );
  //   });
  // }

  // Future<BaseApiResponseModel<SuccessModel>> forgotPassword(
  //     {required String email}) async {
  //   return dioCatchOrThrow(() async {
  //     var response = await dio.post(UrlConstant.forgotPassword, data: {
  //       'email': email,
  //     });

  //     return BaseApiResponseModel.fromJson(
  //       response.data as Map<String, dynamic>,
  //     );
  //   });
  // }

  // Future<BaseApiResponseModel<SuccessModel>> logout() async {
  //   return dioCatchOrThrow(() async {
  //     var response = await dio.post(UrlConstant.logout);

  //     return BaseApiResponseModel.fromJson(
  //       response.data as Map<String, dynamic>,
  //       keyData: 'user',
  //       generatedData: (data) {
  //         return SuccessModel.fromJson(data as Map<String, Object?>);
  //       },
  //     );
  //   });
  // }
}
