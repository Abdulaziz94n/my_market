// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_market/features/client/domain/client_type_enum.dart';
import 'package:objectbox/objectbox.dart';
import 'package:uuid/uuid.dart';

@Entity()
class CompanyClientModel {
  @Id()
  int dbId;
  @Unique()
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
  final int clientTypeId;
  @Transient()
  final ClientType type;
  CompanyClientModel({
    this.dbId = 0,
    required this.id,
    required this.code,
    required this.fullName,
    required this.phoneNumber,
    required this.companyName,
    required this.ice,
    required this.iF,
    required this.email,
    required this.createdBy,
    required this.clientTypeId,
    this.createdAt,
  }) : type = ClientType.companyClient;

  factory CompanyClientModel.initial() {
    final uuid = const Uuid().v4();
    return CompanyClientModel(
      id: uuid,
      clientTypeId: ClientType.companyClient.typeIndex,
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

  CompanyClientModel copyWith({
    String? id,
    int? clientTypeId,
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
    return CompanyClientModel(
      id: id ?? this.id,
      clientTypeId: clientTypeId ?? this.clientTypeId,
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

  @override
  String toString() {
    return 'CompanyClient(id: $id, code: $code, fullName: $fullName, phoneNumber: $phoneNumber, companyName: $companyName, ice: $ice, iF: $iF, email: $email, createdBy: $createdBy, createdAt: $createdAt, type: $type)';
  }

  @override
  bool operator ==(covariant CompanyClientModel other) {
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
