import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/auth/auth.dart';

part 'resend_code_state.dart';

class ResendCodeCubit extends Cubit<ResendCodeState> {
  final AuthRepository authRepository;

  ResendCodeCubit(this.authRepository) : super(ResendCodeInitial());

  Future<void> resend({
    required String email,
    required String type,
  }) async {
    emit(ResendCodeLoading());

    final response = await authRepository.resend(
      type: type,
      email: email,
    );

    emit(
      response.fold(
        (failure) => ResendCodeError(failure),
        (data) => ResendCodeSuccess(message: data.message ?? 'Success'),
      ),
    );
  }
}
