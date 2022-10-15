import 'package:equatable/equatable.dart';

import 'package:spatu_flutter/core/core.dart';

class BaseApiResponseEntity<T> extends Equatable {
  final int code;
  final String status;
  final String message;
  final T? data;

  const BaseApiResponseEntity({
    required this.code,
    required this.status,
    required this.message,
    this.data,
  });

  factory BaseApiResponseEntity.fromBaseApiResponseModel(
    BaseApiResponseModel response, {
    T? data,
  }) =>
      BaseApiResponseEntity(
        code: response.code,
        status: response.status,
        message: response.message,
        data: data,
      );

  @override
  List<Object?> get props {
    return [
      code,
      status,
      message,
      data,
    ];
  }

  BaseApiResponseEntity<T> copyWith({
    required int code,
    required String status,
    required String message,
    T? data,
  }) {
    return BaseApiResponseEntity<T>(
      code: code,
      status: status,
      message: message,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;
}

// class ErrorsEntity {
//   List<dynamic>? email;
//   List<dynamic>? languageId;

//   ErrorsEntity({this.email, this.languageId});
// }
