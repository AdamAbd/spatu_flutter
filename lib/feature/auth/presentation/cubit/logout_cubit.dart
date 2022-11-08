import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthRepository authRepository;

  LogoutCubit(this.authRepository) : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());

    final response = await authRepository.logout();

    emit(
      response.fold(
        (failure) => LogoutError(failure),
        (data) => LogoutSuccess(message: data.message ?? 'Success'),
      ),
    );
  }
}
