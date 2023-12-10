// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_market/features/client/domain/client_type_enum.dart';
import 'package:uuid/uuid.dart';

class CompanyClient {
  final String id;
  final String code;
  final String fullName;
  final String phoneNumber;
  final String companyName;
  final String ice;
  final String iF;
  final String email;
  final String createdBy;
  final DateTime? createdAt;
  final ClientType type;
  CompanyClient({
    required this.id,
    required this.code,
    required this.fullName,
    required this.phoneNumber,
    required this.companyName,
    required this.ice,
    required this.iF,
    required this.email,
    required this.createdBy,
    this.createdAt,
  }) : type = ClientType.companyClient;

  factory CompanyClient.initial() {
    final uuid = const Uuid().v4();
    return CompanyClient(
      id: uuid,
      code: uuid.substring(0, 6),
      fullName: '',
      phoneNumber: '',
      companyName: '',
      ice: '',
      iF: '',
      email: '',
      createdBy: '',
      createdAt: null,
    );
  }

  CompanyClient copyWith({
    String? id,
    String? code,
    String? fullName,
    String? phoneNumber,
    String? companyName,
    String? ice,
    String? iF,
    String? email,
    String? createdBy,
    DateTime? createdAt,
    ClientType? type,
  }) {
    return CompanyClient(
      id: id ?? this.id,
      code: code ?? this.code,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      companyName: companyName ?? this.companyName,
      ice: ice ?? this.ice,
      iF: iF ?? this.iF,
      email: email ?? this.email,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'companyName': companyName,
      'ice': ice,
      'iF': iF,
      'email': email,
      'createdBy': createdBy,
      if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
      'type': type.type,
    };
  }

  factory CompanyClient.fromMap(Map<String, dynamic> map) {
    return CompanyClient(
      id: map['id'] as String,
      code: map['code'] as String,
      fullName: map['fullName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      companyName: map['companyName'] as String,
      ice: map['ice'] as String,
      iF: map['iF'] as String,
      email: map['email'] as String,
      createdBy: map['createdBy'] as String,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyClient.fromJson(String source) =>
      CompanyClient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CompanyClient(id: $id, code: $code, fullName: $fullName, phoneNumber: $phoneNumber, companyName: $companyName, ice: $ice, iF: $iF, email: $email, createdBy: $createdBy, createdAt: $createdAt, type: $type)';
  }

  @override
  bool operator ==(covariant CompanyClient other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.code == code &&
        other.fullName == fullName &&
        other.phoneNumber == phoneNumber &&
        other.companyName == companyName &&
        other.ice == ice &&
        other.iF == iF &&
        other.email == email &&
        other.createdBy == createdBy &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        code.hashCode ^
        fullName.hashCode ^
        phoneNumber.hashCode ^
        companyName.hashCode ^
        ice.hashCode ^
        iF.hashCode ^
        email.hashCode ^
        createdBy.hashCode ^
        type.hashCode;
  }
}
