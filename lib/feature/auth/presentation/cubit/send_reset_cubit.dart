import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

part 'send_reset_state.dart';

class SendResetCubit extends Cubit<SendResetState> {
  final AuthRepository authRepository;

  SendResetCubit(this.authRepository) : super(SendResetInitial());

  Future<void> sendReset({
    required String email,
  }) async {
    emit(SendResetLoading());

    final response = await authRepository.sendReset(
      email: email,
    );

    emit(
      response.fold(
        (failure) => SendResetError(failure),
        (data) => SendResetSuccess(message: data.message ?? 'Success'),
      ),
    );
  }
}
