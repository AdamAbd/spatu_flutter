part of 'google_sign_in_cubit.dart';

abstract class GoogleSignInState extends Equatable {
  const GoogleSignInState();

  @override
  List<Object> get props => [];
}

class GoogleSignInInitial extends GoogleSignInState {}

class GoogleSigninLoading extends GoogleSignInState {}

class GoogleSigninSuccess extends GoogleSignInState {
  final UserCredential? userCredential;

  const GoogleSigninSuccess({this.userCredential});
}

class GoogleSignInError extends GoogleSignInState {
  final Failure failure;

  const GoogleSignInError(this.failure);
}
