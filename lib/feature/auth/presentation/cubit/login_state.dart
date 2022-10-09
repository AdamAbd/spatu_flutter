part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final Failure failure;

  const LoginError(this.failure);
}

class LoginSuccess extends LoginState {
  final UserDataEntity userDataEntity;

  const LoginSuccess({required this.userDataEntity});
}
