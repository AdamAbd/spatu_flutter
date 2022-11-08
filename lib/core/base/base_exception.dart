import 'package:spatu_flutter/core/core.dart';

abstract class BaseException implements Exception {
  final String? message;

  const BaseException(this.message);
}

class RemoteException extends BaseException {
  final BaseApiResponseEntity? error;

  const RemoteException({
    String? message,
    this.error,
  }) : super(message);
}

class LocalException extends BaseException {
  const LocalException({String? message}) : super(message);
}
