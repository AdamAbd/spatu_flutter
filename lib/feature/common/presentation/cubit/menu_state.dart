part of 'menu_cubit.dart';

class MenuState extends Equatable {
  final int index;

  const MenuState({required this.index});

  @override
  List<Object> get props => [index];

  MenuState copyWith({
    int? index,
  }) {
    return MenuState(
      index: index ?? this.index,
    );
  }
}
