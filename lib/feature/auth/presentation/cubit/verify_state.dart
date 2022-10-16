part of 'verify_cubit.dart';

abstract class VerifyState extends Equatable {
  const VerifyState();

  @override
  List<Object> get props => [];
}

class VerifyInitial extends VerifyState {}

class VerifyLoading extends VerifyState {}

class VerifyError extends VerifyState {
  final Failure failure;

  const VerifyError(this.failure);
}

class VerifyEmailSuccess extends VerifyState {
  final UserDataEntity userDataEntity;

  const VerifyEmailSuccess({required this.userDataEntity});
}
