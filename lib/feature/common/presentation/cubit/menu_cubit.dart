import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(const MenuState(index: 0));

  void changeIndex(int bottomNavIndex) => emit(
        state.copyWith(index: bottomNavIndex),
      );
}
