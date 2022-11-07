part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState({
    this.userEntity,
    this.pin,
    this.accessToken,
    this.refreshToken,
  });

  final UserEntity? userEntity;
  final String? pin;
  final String? accessToken;
  final String? refreshToken;

  @override
  List<Object?> get props => [userEntity, pin, accessToken, refreshToken];

  Map<String, dynamic> toMap() {
    return {
      'userEntity': userEntity?.toJson(),
      'pin': pin,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      userEntity: UserEntity.fromJson(map['userEntity'].toString()),
      pin: map['pin']?.toString() ?? '',
      accessToken: map['accessToken']?.toString() ?? '',
      refreshToken: map['refreshToken']?.toString() ?? '',
    );
  }

  UserState copyWith({
    UserEntity? userEntity,
    String? pin,
    String? accessToken,
    String? refreshToken,
  }) {
    return UserState(
      userEntity: userEntity ?? this.userEntity,
      pin: pin ?? this.pin,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
