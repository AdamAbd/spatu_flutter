import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

part 'send_reset_state.dart';

class SendResetCubit extends Cubit<SendResetState> {
  final AuthRepository authRepository;

  SendResetCubit(this.authRepository) : super(SendResetInitial());

  Future<void> resetPassword({
    required int code,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(SendResetLoading());

    final response = await authRepository.resetPassword(
      code: code,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

    emit(
      response.fold(
        (failure) => SendResetError(failure),
        (data) => SendResetSuccess(message: data.message ?? 'Success'),
      ),
    );
  }
}
