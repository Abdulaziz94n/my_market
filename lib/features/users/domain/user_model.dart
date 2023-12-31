// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_market/features/users/domain/gender_enum.dart';
import 'package:my_market/features/users/domain/user_role_enum.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UserModel {
  int id;
  final String name;
  final String password;
  final String nationalId;
  final int? phoneNumber;
  final int roleId;
  final int genderId;
  final String? registrationDate;
  final String? deactivateDate;

  UserModel({
    this.id = 0,
    this.phoneNumber = 0,
    required this.name,
    required this.nationalId,
    required this.password,
    required this.roleId,
    required this.genderId,
    this.registrationDate,
    this.deactivateDate,
  });

  factory UserModel.initial() {
    return UserModel(
      name: '',
      password: '',
      nationalId: '',
      roleId: 1,
      genderId: 1,
      deactivateDate: '',
      registrationDate: '',
    );
  }

  UserRole get role {
    return UserRole.values.firstWhere((element) => element.id == roleId);
  }

  Gender get gender {
    return Gender.values.firstWhere((element) => element.id == genderId);
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? nationalId,
    String? password,
    String? registrationDate,
    String? deactivateDate,
    int? roleId,
    int? genderId,
    int? phoneNumber,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      nationalId: nationalId ?? this.nationalId,
      password: password ?? this.password,
      roleId: roleId ?? this.roleId,
      genderId: genderId ?? this.genderId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      registrationDate: registrationDate ?? this.registrationDate,
      deactivateDate: deactivateDate ?? this.deactivateDate,
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
      nationalId: map['nationalId'] as String,
      password: map['password'] as String,
      roleId: map['roleId'] as int,
      genderId: map['genderId'] as int,
      registrationDate: map['registrationDate'] as String,
      deactivateDate: map['deactivateDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
