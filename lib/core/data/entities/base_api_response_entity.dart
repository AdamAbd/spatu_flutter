import 'package:equatable/equatable.dart';

import 'package:spatu_flutter/core/core.dart';

class BaseApiResponseEntity<T> extends Equatable {
  final int status;
  final String message;
  final T? data;

  const BaseApiResponseEntity({
    required this.status,
    required this.message,
    this.data,
  });

  factory BaseApiResponseEntity.fromBaseApiResponseModel(
    BaseApiResponseModel response, {
    T? data,
  }) =>
      BaseApiResponseEntity(
        status: response.status,
        message: response.message,
        data: data,
      );

  @override
  List<Object?> get props {
    return [
      status,
      message,
      data,
    ];
  }

  BaseApiResponseEntity<T> copyWith({
    required int status,
    required String message,
    T? data,
  }) {
    return BaseApiResponseEntity<T>(
      message: message,
      status: status,
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
