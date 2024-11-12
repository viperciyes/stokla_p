/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Shop implements _i1.SerializableModel {
  Shop._({
    this.id,
    required this.userId,
    required this.businessName,
    required this.cityId,
    required this.districtId,
    required this.phone,
    required this.email,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Shop({
    int? id,
    required int userId,
    required String businessName,
    required int cityId,
    required int districtId,
    required String phone,
    required String email,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime deletedAt,
  }) = _ShopImpl;

  factory Shop.fromJson(Map<String, dynamic> jsonSerialization) {
    return Shop(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      businessName: jsonSerialization['businessName'] as String,
      cityId: jsonSerialization['cityId'] as int,
      districtId: jsonSerialization['districtId'] as int,
      phone: jsonSerialization['phone'] as String,
      email: jsonSerialization['email'] as String,
      isActive: jsonSerialization['isActive'] as bool,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      deletedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String businessName;

  int cityId;

  int districtId;

  String phone;

  String email;

  bool isActive;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime deletedAt;

  Shop copyWith({
    int? id,
    int? userId,
    String? businessName,
    int? cityId,
    int? districtId,
    String? phone,
    String? email,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'businessName': businessName,
      'cityId': cityId,
      'districtId': districtId,
      'phone': phone,
      'email': email,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'deletedAt': deletedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ShopImpl extends Shop {
  _ShopImpl({
    int? id,
    required int userId,
    required String businessName,
    required int cityId,
    required int districtId,
    required String phone,
    required String email,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime deletedAt,
  }) : super._(
          id: id,
          userId: userId,
          businessName: businessName,
          cityId: cityId,
          districtId: districtId,
          phone: phone,
          email: email,
          isActive: isActive,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deletedAt: deletedAt,
        );

  @override
  Shop copyWith({
    Object? id = _Undefined,
    int? userId,
    String? businessName,
    int? cityId,
    int? districtId,
    String? phone,
    String? email,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return Shop(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      businessName: businessName ?? this.businessName,
      cityId: cityId ?? this.cityId,
      districtId: districtId ?? this.districtId,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
