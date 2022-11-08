part of 'send_reset_cubit.dart';

abstract class SendResetState extends Equatable {
  const SendResetState();

  @override
  List<Object> get props => [];
}

class SendResetInitial extends SendResetState {}

class SendResetLoading extends SendResetState {}

class SendResetError extends SendResetState {
  final Failure failure;

  const SendResetError(this.failure);
}

class SendResetSuccess extends SendResetState {
  final String message;

  const SendResetSuccess({required this.message});
}
