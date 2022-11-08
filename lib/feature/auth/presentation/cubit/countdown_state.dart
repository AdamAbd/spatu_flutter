part of 'countdown_cubit.dart';

class CountdownState extends Equatable {
  final int start;

  const CountdownState({required this.start});

  @override
  List<Object> get props => [start];

  CountdownState copyWith({
    int? start,
  }) {
    return CountdownState(
      start: start ?? this.start,
    );
  }
}
