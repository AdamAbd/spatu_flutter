part of 'user_detail_cubit.dart';

abstract class UserDetailState extends Equatable {
  const UserDetailState();

  @override
  List<Object> get props => [];
}

class UserDetailInitial extends UserDetailState {}

class UserDetailLoading extends UserDetailState {}

class UserDetailError extends UserDetailState {
  final Failure failure;

  const UserDetailError(this.failure);
}

class UserDetailSuccess extends UserDetailState {
  final String message;
  final UserDataEntity userDataEntity;

  const UserDetailSuccess({required this.message, required this.userDataEntity});
}
