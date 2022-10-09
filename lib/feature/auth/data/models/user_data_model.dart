import 'package:spatu_flutter/feature/feature.dart';

class UserDataModel {
  UserModel user;
  String accessToken;

  UserDataModel({required this.user, required this.accessToken});

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
        accessToken: json['access_token'] as String,
      );

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'access_token': accessToken,
      };

  UserDataEntity toUserDataEntity() => UserDataEntity(
        user: user.toUserEntity(),
        accessToken: accessToken,
      );
}
