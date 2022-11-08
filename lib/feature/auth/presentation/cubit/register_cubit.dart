import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository authRepository;

  RegisterCubit(this.authRepository) : super(RegisterInitial());

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());

    final response = await authRepository.register(
      username: username,
      email: email,
      password: password,
    );

    emit(
      response.fold(
        (failure) => RegisterError(failure),
        (data) => RegisterSuccess(message: data.message ?? 'Success'),
      ),
    );
  }
}
