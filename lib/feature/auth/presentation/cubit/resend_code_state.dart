part of 'resend_code_cubit.dart';

abstract class ResendCodeState extends Equatable {
  const ResendCodeState();

  @override
  List<Object> get props => [];
}

class ResendCodeInitial extends ResendCodeState {}

class ResendCodeLoading extends ResendCodeState {}

class ResendCodeError extends ResendCodeState {
  final Failure failure;

  const ResendCodeError(this.failure);
}

class ResendCodeSuccess extends ResendCodeState {
  final String message;

  const ResendCodeSuccess({required this.message});
}
