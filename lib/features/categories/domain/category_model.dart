// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_market/features/categories/domain/category_entity.dart';

class CategoryModel {
  CategoryModel({
    required this.name,
    this.localId = 0,
    required this.globalId,
    this.productsCount = 0,
    this.createdAt,
    this.createdBy,
  });

  final String name;
  final int localId;
  final String globalId;
  final int? productsCount;
  final DateTime? createdAt;
  final String? createdBy;

  CategoryModel copyWith({
    String? name,
    int? productsCount,
    DateTime? createdAt,
    String? createdBy,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      localId: localId,
      globalId: globalId,
      productsCount: productsCount ?? this.productsCount,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: localId,
      name: name,
      globalId: globalId,
      createdBy: createdBy!,
      createdAt: createdAt!,
    );
  }

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      name: entity.name,
      globalId: entity.globalId,
      productsCount: entity.productsCount,
      createdAt: entity.createdAt,
      createdBy: entity.createdBy,
      localId: entity.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'localId': localId,
      'globalId': globalId,
      'productsCount': productsCount,
      if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
      'createdBy': createdBy,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] as String,
      localId: map['localId'] as int,
      globalId: map['globalId'] as String,
      productsCount:
          map['productsCount'] != null ? map['productsCount'] as int : null,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      createdBy: map['createdBy'] != null ? map['createdBy'] as String : null,
    );
  }

  @override
  String toString() {
    return 'CategoryModel(name: $name, localId: $localId, globalId: $globalId, productsCount: $productsCount, createdAt: $createdAt, createdBy: $createdBy)';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.localId == localId &&
        other.globalId == globalId &&
        other.productsCount == productsCount &&
        other.createdAt == createdAt &&
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        localId.hashCode ^
        globalId.hashCode ^
        productsCount.hashCode ^
        createdAt.hashCode ^
        createdBy.hashCode;
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
