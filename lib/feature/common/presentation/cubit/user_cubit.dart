import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'user_state.dart';

class UserCubit extends HydratedCubit<UserState> {
  UserCubit() : super(const UserState());

  Future<void> saveUserPin({required String pin}) async {
    emit(state.copyWith(pin: pin));
  }

  Future<void> logOut() async {
    emit(const UserState());

    clear();
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    try {
      return UserState(pin: json['pin'].toString());
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    try {
      return {'pin': state.pin};
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
