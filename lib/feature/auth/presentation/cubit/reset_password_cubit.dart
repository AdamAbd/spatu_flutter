import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepository authRepository;

  ResetPasswordCubit(this.authRepository) : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required int code,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(ResetPasswordLoading());

    final response = await authRepository.resetPassword(
      code: code,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

    emit(
      response.fold(
        (failure) => ResetPasswordError(failure),
        (data) => ResetPasswordSuccess(message: data.message ?? 'Success'),
      ),
    );
  }
}
