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

abstract class Product implements _i1.SerializableModel {
  Product._({
    this.id,
    required this.dealerId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isVisible,
    required this.isApproved,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Product({
    int? id,
    required int dealerId,
    required String name,
    required String description,
    required double price,
    required String imageUrl,
    required bool isVisible,
    required bool isApproved,
    required bool isActive,
    required bool isDeleted,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime deletedAt,
  }) = _ProductImpl;

  factory Product.fromJson(Map<String, dynamic> jsonSerialization) {
    return Product(
      id: jsonSerialization['id'] as int?,
      dealerId: jsonSerialization['dealerId'] as int,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      price: (jsonSerialization['price'] as num).toDouble(),
      imageUrl: jsonSerialization['imageUrl'] as String,
      isVisible: jsonSerialization['isVisible'] as bool,
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

  int dealerId;

  String name;

  String description;

  double price;

  String imageUrl;

  bool isVisible;

  bool isApproved;

  bool isActive;

  bool isDeleted;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime deletedAt;

  Product copyWith({
    int? id,
    int? dealerId,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    bool? isVisible,
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
      'dealerId': dealerId,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isVisible': isVisible,
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

class _ProductImpl extends Product {
  _ProductImpl({
    int? id,
    required int dealerId,
    required String name,
    required String description,
    required double price,
    required String imageUrl,
    required bool isVisible,
    required bool isApproved,
    required bool isActive,
    required bool isDeleted,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime deletedAt,
  }) : super._(
          id: id,
          dealerId: dealerId,
          name: name,
          description: description,
          price: price,
          imageUrl: imageUrl,
          isVisible: isVisible,
          isApproved: isApproved,
          isActive: isActive,
          isDeleted: isDeleted,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deletedAt: deletedAt,
        );

  @override
  Product copyWith({
    Object? id = _Undefined,
    int? dealerId,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    bool? isVisible,
    bool? isApproved,
    bool? isActive,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return Product(
      id: id is int? ? id : this.id,
      dealerId: dealerId ?? this.dealerId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isVisible: isVisible ?? this.isVisible,
      isApproved: isApproved ?? this.isApproved,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
