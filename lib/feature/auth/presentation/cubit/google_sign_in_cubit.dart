import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  final GoogleSignInRepository _googleSignInRepository;

  GoogleSignInCubit(this._googleSignInRepository)
      : super(GoogleSignInInitial());

  Future<void> signInWithGoogle() async {
    emit(GoogleSigninLoading());

    final response = await _googleSignInRepository.googleSignIn();

    emit(
      response.fold(
        (failure) => GoogleSignInError(failure),
        (user) => GoogleSigninSuccess(userCredential: user),
      ),
    );
  }

  Future<void> signOutFromGoogle() async {
    emit(GoogleSigninLoading());

    await _googleSignInRepository.googleSignOut();

    emit(const GoogleSigninSuccess());
  }
}
