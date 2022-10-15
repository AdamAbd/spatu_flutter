part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterError extends RegisterState {
  final Failure failure;

  const RegisterError(this.failure);
}

class RegisterSuccess extends RegisterState {
  final String message;

  const RegisterSuccess({required this.message});
}
