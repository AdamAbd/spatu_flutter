import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

part 'user_detail_state.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  final HomeRepository homeRepository;

  UserDetailCubit(this.homeRepository) : super(UserDetailInitial());

  Future<void> getUserDetail() async {
    emit(UserDetailLoading());

    final response = await homeRepository.getUserDetail();

    emit(
      response.fold(
        (failure) => UserDetailError(failure),
        (user) => UserDetailSuccess(
          message: user.message ?? MessageConstant.successLogin,
          userDataEntity: user.data!,
        ),
      ),
    );
  }
}
