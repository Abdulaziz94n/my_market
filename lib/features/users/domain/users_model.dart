// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_market/features/users/domain/user_role_enum.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UserModel {
  int id;
  final String name;
  final String password;
  final int roleId;

  UserModel({
    this.id = 0,
    required this.name,
    required this.password,
    required this.roleId,
  });

  UserRole get role {
    return UserRole.values.firstWhere((element) => element.id == roleId);
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? password,
    int? roleId,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      roleId: roleId ?? this.roleId,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, userName: $name, password: $password, roleId: $roleId)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.password == password &&
        other.roleId == roleId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ password.hashCode ^ roleId.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userName': name,
      'password': password,
      'roleId': roleId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['userName'] as String,
      password: map['password'] as String,
      roleId: map['roleId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
