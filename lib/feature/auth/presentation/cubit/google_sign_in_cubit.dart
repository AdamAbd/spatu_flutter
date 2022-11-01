import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  final GoogleSignInRepository googleSignInRepository;
  final AuthRepository authRepository;

  GoogleSignInCubit(this.googleSignInRepository, this.authRepository)
      : super(GoogleSignInInitial());

  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());

    final response = await googleSignInRepository.googleSignIn();

    emit(
      response.fold(
        (failure) => GoogleSignInError(failure),
        (user) {
          googleLogin(
            username: user.user?.displayName ?? '',
            email: user.user?.email ?? '',
            avatar: user.user?.photoURL ?? '',
            googleId: user.user?.uid ?? '',
          );

          // return GoogleSignInSuccess(userCredential: user);
          return GoogleSignInLoading();
        },
      ),
    );
  }

  Future<void> googleLogin({
    required String username,
    required String email,
    required String avatar,
    required String googleId,
  }) async {
    // emit(GoogleSignInLoading());

    final response = await authRepository.googleLogin(
      username: username,
      email: email,
      avatar: avatar,
      googleId: googleId,
    );

    emit(
      response.fold(
        (failure) => GoogleLoginError(failure),
        (user) => GoogleLoginSuccess(userDataEntity: user.data!),
      ),
    );
  }

  Future<void> signOutFromGoogle() async {
    emit(GoogleSignInLoading());

    await googleSignInRepository.googleSignOut();

    emit(const GoogleSignInSuccess());
  }
}
