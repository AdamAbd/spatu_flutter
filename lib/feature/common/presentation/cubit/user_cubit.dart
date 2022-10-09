import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spatu_flutter/feature/feature.dart';

part 'user_state.dart';

class UserCubit extends HydratedCubit<UserState> {
  UserCubit() : super(const UserState());

  Future<void> saveUserPin({required String pin}) async {
    emit(state.copyWith(pin: pin));
  }

  Future<void> updateUser({
    required UserEntity userEntity,
  }) async {
    emit(state.copyWith(userEntity: userEntity));
  }

  Future<void> logOut() async {
    emit(const UserState());

    clear();
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    try {
      return UserState(
        userEntity: UserEntity.fromMap(
          jsonDecode(json['userEntity'].toString()) as Map<String, dynamic>,
        ),
        pin: json['pin'].toString(),
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    try {
      return {
        'userEntity': state.userEntity,
        'pin': state.pin,
      };
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
