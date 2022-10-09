import 'package:spatu_flutter/feature/feature.dart';

class UserModel {
  String id;
  String username;
  String email;
  DateTime? emailVerifiedAt;
  String? avatar;
  String roles;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.emailVerifiedAt,
    this.avatar,
    required this.roles,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
        emailVerifiedAt: json['email_verified_at'] == null
            ? null
            : DateTime.parse(json['email_verified_at'] as String),
        avatar: json['avatar'] as String?,
        roles: json['roles'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'email_verified_at': emailVerifiedAt?.toIso8601String(),
        'avatar': avatar,
        'roles': roles,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  UserEntity toUserEntity() => UserEntity(
        id: id,
        username: username,
        email: email,
        emailVerifiedAt: emailVerifiedAt,
        avatar: avatar,
        roles: roles,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
