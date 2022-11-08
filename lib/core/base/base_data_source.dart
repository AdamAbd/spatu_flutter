import 'dart:io';

import 'package:dio/dio.dart';
import 'package:spatu_flutter/core/core.dart';

abstract class BaseDataSource {
  Future<T> dioCatchOrThrow<T>(Future<T> Function() body) async {
    try {
      return await body();
    } on SocketException {
      throw const RemoteException(
        message: MessageConstant.noInternetConnection,
      );
    } on DioError catch (e) {
      if (e.message.contains('SocketException')) {
        throw const RemoteException(
          message: MessageConstant.noInternetConnection,
        );
      } else {
        final response = e.response;

        if (response != null) {
          final errorModel = BaseApiResponseModel.fromJson(
            response.data as Map<String, Object?>,
          );
          throw RemoteException(
            // message: errorModel.errors?.email.toString(),
            error: BaseApiResponseEntity.fromBaseApiResponseModel(errorModel),
          );
        }

        throw RemoteException(message: e.message);
      }
    } catch (e) {
      throw const RemoteException(message: MessageConstant.defaultErrorMessage);
    }
  }
}
