part of 'verify_code_cubit.dart';

abstract class VerifyCodeState extends Equatable {
  const VerifyCodeState();

  @override
  List<Object> get props => [];
}

class VerifyCodeInitial extends VerifyCodeState {}

class VerifyCodeLoading extends VerifyCodeState {}

class VerifyCodeError extends VerifyCodeState {
  final Failure failure;

  const VerifyCodeError(this.failure);
}

class VerifyCodeEmailSuccess extends VerifyCodeState {
  final UserDataEntity userDataEntity;

  const VerifyCodeEmailSuccess({required this.userDataEntity});
}

class VerifyCodeResetSuccess extends VerifyCodeState {
  final String message;

  const VerifyCodeResetSuccess({required this.message});
}
