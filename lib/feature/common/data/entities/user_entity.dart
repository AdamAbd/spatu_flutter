import 'dart:convert';

class UserEntity {
  String? id;
  String? username;
  String? email;
  DateTime? emailVerifiedAt;
  String? avatar;
  String? roles;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserEntity({
    this.id,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.avatar,
    this.roles,
    this.createdAt,
    this.updatedAt,
  });

  UserEntity copyWith({
    required String id,
    required String username,
    required String email,
    DateTime? emailVerifiedAt,
    String? avatar,
    required String roles,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) {
    return UserEntity(
      id: id,
      username: username,
      email: email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      avatar: avatar ?? this.avatar,
      roles: roles,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'emailVerifiedAt': emailVerifiedAt?.millisecondsSinceEpoch,
      'avatar': avatar,
      'roles': roles,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'].toString(),
      username: map['username'].toString(),
      email: map['email'].toString(),
      emailVerifiedAt: map['emailVerifiedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              int.parse(map['emailVerifiedAt'].toString()),
            )
          : null,
      avatar: map['avatar']?.toString(),
      roles: map['roles'].toString(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        int.parse(map['createdAt'].toString()),
      ),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(
        int.parse(map['updatedAt'].toString()),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
