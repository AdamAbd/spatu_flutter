import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepository authRepository;

  ResetPasswordCubit(this.authRepository) : super(ResetPasswordInitial());

  Future<void> reset({
    required String email,
  }) async {
    emit(ResetPasswordLoading());

    final response = await authRepository.reset(
      email: email,
    );

    emit(
      response.fold(
        (failure) => ResetPasswordError(failure),
        (data) => ResetPasswordSuccess(message: data.message ?? 'Success'),
      ),
    );
  }
}
