part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState({this.pin});

  final String? pin;

  @override
  List<Object?> get props => [pin];

  Map<String, dynamic> toMap() {
    return {
      'pin': pin,
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      pin: map['token']?.toString() ?? '',
    );
  }

  UserState copyWith({
    String? pin,
  }) {
    return UserState(
      pin: pin ?? this.pin,
    );
  }
}
