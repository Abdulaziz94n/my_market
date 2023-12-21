import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart' hide Index;
import 'package:my_market/features/client/domain/client_type_enum.dart';
import 'package:objectbox/objectbox.dart';
import 'package:uuid/uuid.dart';

@Entity()
class CreditClientModel {
  @Id()
  int dbId;
  final String fullName;
  @Unique()
  final String id;
  final String code;
  final String phoneNumber;
  final ClientType type;
  final String createdBy;
  final DateTime? createdAt;
  // final orders = ToMany<CreditOrderModel>();

  CreditClientModel({
    this.dbId = 0,
    required this.fullName,
    required this.id,
    required this.code,
    required this.phoneNumber,
    required this.createdBy,
    this.createdAt,
  }) : type = ClientType.creditClient;

  factory CreditClientModel.initial() {
    final uuid = const Uuid().v4();
    return CreditClientModel(
      fullName: '',
      id: uuid,
      code: uuid.substring(0, 6),
      phoneNumber: '',
      createdBy: '',
    );
  }

  CreditClientModel copyWith({
    String? fullName,
    String? id,
    String? code,
    String? phoneNumber,
    String? createdBy,
    DateTime? createdAt,
  }) {
    return CreditClientModel(
      fullName: fullName ?? this.fullName,
      id: id ?? this.id,
      code: code ?? this.code,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'id': id,
      'code': code,
      'phoneNumber': phoneNumber,
      'type': type.type,
      'createdBy': createdBy,
      if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
    };
  }

  factory CreditClientModel.fromMap(Map<String, dynamic> map) {
    return CreditClientModel(
      fullName: map['fullName'] as String,
      id: map['id'] as String,
      code: map['code'] as String,
      phoneNumber: map['phoneNumber'] as String,
      createdBy: map['createdBy'] as String,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditClientModel.fromJson(String source) =>
      CreditClientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PersonClientModel(fullName: $fullName, id: $id, code: $code, phoneNumber: $phoneNumber, type: $type, createdBy: $createdBy, createdAt: $createdAt, dbId: $dbId)';
  }

  @override
  bool operator ==(covariant CreditClientModel other) {
    if (identical(this, other)) return true;

    return other.fullName == fullName &&
        other.id == id &&
        other.code == code &&
        other.phoneNumber == phoneNumber &&
        other.type == type &&
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        id.hashCode ^
        code.hashCode ^
        phoneNumber.hashCode ^
        type.hashCode ^
        createdBy.hashCode;
  }
}
