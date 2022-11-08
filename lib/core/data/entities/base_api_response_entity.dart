import 'package:equatable/equatable.dart';

import 'package:spatu_flutter/core/core.dart';

class BaseApiResponseEntity<T> extends Equatable {
  final int code;
  final String status;
  final String? message;
  final String? errors;
  final T? data;

  const BaseApiResponseEntity({
    required this.code,
    required this.status,
    this.message,
    this.errors,
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
        errors: response.errors,
        data: data,
      );

  @override
  List<Object?> get props {
    return [
      code,
      status,
      message,
      errors,
      data,
    ];
  }

  BaseApiResponseEntity<T> copyWith({
    required int code,
    required String status,
    String? message,
    String? errors,
    T? data,
  }) {
    return BaseApiResponseEntity<T>(
      code: code,
      status: status,
      message: message,
      errors: errors,
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
