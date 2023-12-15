// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()
class UsersModel {
  int id;
  final String userName;
  final String password;
  final int roleId;

  UsersModel({
    required this.id,
    required this.userName,
    required this.password,
    required this.roleId,
  });

  UsersModel copyWith({
    int? id,
    String? userName,
    String? password,
    int? roleId,
  }) {
    return UsersModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      roleId: roleId ?? this.roleId,
    );
  }

  @override
  String toString() {
    return 'UsersModel(id: $id, userName: $userName, password: $password, roleId: $roleId)';
  }

  @override
  bool operator ==(covariant UsersModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userName == userName &&
        other.password == password &&
        other.roleId == roleId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userName.hashCode ^
        password.hashCode ^
        roleId.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userName': userName,
      'password': password,
      'roleId': roleId,
    };
  }

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      id: map['id'] as int,
      userName: map['userName'] as String,
      password: map['password'] as String,
      roleId: map['roleId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersModel.fromJson(String source) =>
      UsersModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
