import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final AuthRepository authRepository;

  VerifyCodeCubit(this.authRepository) : super(VerifyCodeInitial());

  Future<void> verifyEmail({
    required int code,
  }) async {
    emit(VerifyCodeLoading());

    final response = await authRepository.verifyEmail(code: code);

    emit(
      response.fold(
        (failure) => VerifyCodeError(failure),
        (user) => VerifyCodeEmailSuccess(userDataEntity: user.data!),
      ),
    );
  }

  Future<void> verifyReset({
    required int code,
  }) async {
    emit(VerifyCodeLoading());

    final response = await authRepository.verifyReset(code: code);

    emit(
      response.fold(
        (failure) => VerifyCodeError(failure),
        (data) => VerifyCodeResetSuccess(message: data.message ?? 'Success'),
      ),
    );
  }
}
