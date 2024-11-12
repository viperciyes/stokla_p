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

abstract class Dealer implements _i1.SerializableModel {
  Dealer._({
    this.id,
    required this.userId,
    required this.businessName,
    required this.deliveryAreaIds,
    required this.isApproved,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Dealer({
    int? id,
    required int userId,
    required String businessName,
    required List<int> deliveryAreaIds,
    required bool isApproved,
    required bool isActive,
    required bool isDeleted,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime deletedAt,
  }) = _DealerImpl;

  factory Dealer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Dealer(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      businessName: jsonSerialization['businessName'] as String,
      deliveryAreaIds: (jsonSerialization['deliveryAreaIds'] as List)
          .map((e) => e as int)
          .toList(),
      isApproved: jsonSerialization['isApproved'] as bool,
      isActive: jsonSerialization['isActive'] as bool,
      isDeleted: jsonSerialization['isDeleted'] as bool,
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

  List<int> deliveryAreaIds;

  bool isApproved;

  bool isActive;

  bool isDeleted;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime deletedAt;

  Dealer copyWith({
    int? id,
    int? userId,
    String? businessName,
    List<int>? deliveryAreaIds,
    bool? isApproved,
    bool? isActive,
    bool? isDeleted,
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
      'deliveryAreaIds': deliveryAreaIds.toJson(),
      'isApproved': isApproved,
      'isActive': isActive,
      'isDeleted': isDeleted,
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

class _DealerImpl extends Dealer {
  _DealerImpl({
    int? id,
    required int userId,
    required String businessName,
    required List<int> deliveryAreaIds,
    required bool isApproved,
    required bool isActive,
    required bool isDeleted,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime deletedAt,
  }) : super._(
          id: id,
          userId: userId,
          businessName: businessName,
          deliveryAreaIds: deliveryAreaIds,
          isApproved: isApproved,
          isActive: isActive,
          isDeleted: isDeleted,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deletedAt: deletedAt,
        );

  @override
  Dealer copyWith({
    Object? id = _Undefined,
    int? userId,
    String? businessName,
    List<int>? deliveryAreaIds,
    bool? isApproved,
    bool? isActive,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return Dealer(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      businessName: businessName ?? this.businessName,
      deliveryAreaIds:
          deliveryAreaIds ?? this.deliveryAreaIds.map((e0) => e0).toList(),
      isApproved: isApproved ?? this.isApproved,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
