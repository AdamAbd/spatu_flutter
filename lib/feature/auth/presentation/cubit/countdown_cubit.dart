import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'countdown_state.dart';

class CountdownCubit extends Cubit<CountdownState> {
  late Timer timer;

  CountdownCubit() : super(const CountdownState(start: 60));

  void startCountdown() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (state.start == 0) {
          timer.cancel();
          // setState(() {
          //   timer.cancel();
          // });
        } else {
          emit(state.copyWith(start: state.start - 1));
          // setState(() {
          //   _start--;
          // });
        }
      },
    );
  }

  void reset() {
    startCountdown();

    emit(state.copyWith(start: 60));
  }

  void cancel() {
    timer.cancel();
  }
}
