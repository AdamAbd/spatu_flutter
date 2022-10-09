part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState({this.userEntity, this.pin});

  final UserEntity? userEntity;
  final String? pin;

  @override
  List<Object?> get props => [userEntity, pin];

  Map<String, dynamic> toMap() {
    return {
      'userEntity': userEntity?.toJson(),
      'pin': pin,
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      userEntity: UserEntity.fromJson(map['userEntity'].toString()),
      pin: map['pin']?.toString() ?? '',
    );
  }

  UserState copyWith({
    UserEntity? userEntity,
    String? pin,
  }) {
    return UserState(
      userEntity: userEntity ?? this.userEntity,
      pin: pin ?? this.pin,
    );
  }
}
