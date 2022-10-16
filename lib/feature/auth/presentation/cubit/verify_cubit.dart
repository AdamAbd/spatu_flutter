import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  final AuthRepository authRepository;

  VerifyCubit(this.authRepository) : super(VerifyInitial());

  Future<void> verifyEmail({
    required int code,
  }) async {
    emit(VerifyLoading());

    final response = await authRepository.verifyEmail(code: code);

    emit(
      response.fold(
        (failure) => VerifyError(failure),
        (user) => VerifyEmailSuccess(userDataEntity: user.data!),
      ),
    );
  }

  // Future<void> verifyReset({
  //   required String email,
  //   required String password,
  // }) async {
  //   emit(VerifyLoading());

  //   final response = await authRepository.verify(
  //     code: 896320,
  //     type: email,
  //     password: Werr14113,
  //     password_confirmation: Werr14113,
  //   );

  //   emit(
  //     response.fold(
  //       (failure) => VerifyError(failure),
  //       (user) => VerifySuccess(userDataEntity: user.data!),
  //     ),
  //   );
  // }
}
