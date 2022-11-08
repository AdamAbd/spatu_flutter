import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    final response = await authRepository.login(
      email: email,
      password: password,
    );

    emit(
      response.fold(
        (failure) => LoginError(failure),
        (user) => LoginSuccess(
          message: user.message ?? MessageConstant.successLogin,
          userDataEntity: user.data!,
        ),
      ),
    );
  }
}
