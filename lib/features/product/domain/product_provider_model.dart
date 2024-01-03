import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductProviderModel {
  final String name;
  final String globalId;
  final int localId;
  final DateTime? createdAt;
  final String createdBy;

  ProductProviderModel({
    required this.name,
    required this.globalId,
    this.localId = 0,
    this.createdAt,
    required this.createdBy,
  });

  ProductProviderModel copyWith({
    String? name,
    String? globalId,
    int? localId,
    DateTime? createdAt,
    String? createdBy,
  }) {
    return ProductProviderModel(
      name: name ?? this.name,
      globalId: globalId ?? this.globalId,
      localId: localId ?? this.localId,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'globalId': globalId,
      'localId': localId,
      if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
      'createdBy': createdBy,
    };
  }

  factory ProductProviderModel.fromMap(Map<String, dynamic> map) {
    return ProductProviderModel(
      name: map['name'] as String,
      globalId: map['globalId'] as String,
      localId: map['localId'] as int,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      createdBy: map['createdBy'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductProviderModel.fromJson(String source) =>
      ProductProviderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductProviderModel(name: $name, globalId: $globalId, localId: $localId, createdAt: $createdAt, createdBy: $createdBy)';
  }

  @override
  bool operator ==(covariant ProductProviderModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.globalId == globalId &&
        other.localId == localId &&
        other.createdAt == createdAt &&
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        globalId.hashCode ^
        localId.hashCode ^
        createdAt.hashCode ^
        createdBy.hashCode;
  }
}
