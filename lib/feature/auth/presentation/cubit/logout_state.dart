part of 'logout_cubit.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutError extends LogoutState {
  final Failure failure;

  const LogoutError(this.failure);
}

class LogoutSuccess extends LogoutState {
  final String message;

  const LogoutSuccess({required this.message});
}
