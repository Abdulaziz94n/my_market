// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_market/features/categories/domain/plus_category_entity.dart';

class PlusCategoryModel {
  final int localId;
  final String globalId;
  final String name;
  final int productsCount;
  final DateTime? createdAt;
  final String createdBy;
  PlusCategoryModel({
    this.localId = 0,
    required this.globalId,
    required this.name,
    this.productsCount = 0,
    this.createdAt,
    required this.createdBy,
  });

  PlusCategoryModel copyWith({
    String? name,
    DateTime? createdAt,
    String? createdBy,
  }) {
    return PlusCategoryModel(
      localId: localId,
      globalId: globalId,
      name: name ?? this.name,
      productsCount: productsCount,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  PlusCategoryEntity toEntity() {
    return PlusCategoryEntity(
      globalId: globalId,
      name: name,
      createdBy: createdBy,
    );
  }

  factory PlusCategoryModel.fromEntity(PlusCategoryEntity entity) {
    return PlusCategoryModel(
      localId: entity.id,
      productsCount: entity.productsCount,
      createdAt: entity.createdAt,
      globalId: entity.globalId,
      name: entity.name,
      createdBy: entity.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'localId': localId,
      'globalId': globalId,
      'name': name,
      'productsCount': productsCount,
      if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
      'createdBy': createdBy,
    };
  }

  factory PlusCategoryModel.fromMap(Map<String, dynamic> map) {
    return PlusCategoryModel(
      localId: map['localId'] as int,
      globalId: map['globalId'] as String,
      name: map['name'] as String,
      productsCount: map['productsCount'] as int,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      createdBy: map['createdBy'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlusCategoryModel.fromJson(String source) =>
      PlusCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlusCategoryModel(localId: $localId, globalId: $globalId, name: $name, productsCount: $productsCount, createdAt: $createdAt, createdBy: $createdBy)';
  }

  @override
  bool operator ==(covariant PlusCategoryModel other) {
    if (identical(this, other)) return true;

    return other.localId == localId &&
        other.globalId == globalId &&
        other.name == name &&
        other.productsCount == productsCount &&
        other.createdAt == createdAt &&
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return localId.hashCode ^
        globalId.hashCode ^
        name.hashCode ^
        productsCount.hashCode ^
        createdAt.hashCode ^
        createdBy.hashCode;
  }
}
