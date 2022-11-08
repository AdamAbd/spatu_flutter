import 'package:spatu_flutter/feature/feature.dart';

class UserDataModel {
  UserModel user;

  UserDataModel({required this.user});

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
      };

  UserDataEntity toUserDataEntity() => UserDataEntity(
        user: user.toUserEntity(),
      );
}
