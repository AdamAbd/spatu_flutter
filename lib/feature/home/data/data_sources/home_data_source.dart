import 'package:dio/dio.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

class HomeRemoteDataSource with BaseDataSource {
  final Dio dio;

  HomeRemoteDataSource(this.dio);

  Future<BaseApiResponseModel<UserDataModel>> getUserDetail() async {
    return dioCatchOrThrow(() async {
      final response = await dio.get(
        UrlConstant.userDetail,
      );

      return BaseApiResponseModel.fromJson(
        response.data as Map<String, dynamic>,
        generatedData: (data) {
          return UserDataModel.fromJson(data as Map<String, dynamic>);
        },
      );
    });
  }
}
