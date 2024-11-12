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
import 'protocol.dart' as _i2;

abstract class Order implements _i1.SerializableModel {
  Order._({
    this.id,
    required this.shopId,
    required this.dealerId,
    required this.items,
    required this.status,
    required this.createdAt,
  });

  factory Order({
    int? id,
    required int shopId,
    required int dealerId,
    required List<_i2.OrderItem> items,
    required String status,
    required DateTime createdAt,
  }) = _OrderImpl;

  factory Order.fromJson(Map<String, dynamic> jsonSerialization) {
    return Order(
      id: jsonSerialization['id'] as int?,
      shopId: jsonSerialization['shopId'] as int,
      dealerId: jsonSerialization['dealerId'] as int,
      items: (jsonSerialization['items'] as List)
          .map((e) => _i2.OrderItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      status: jsonSerialization['status'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int shopId;

  int dealerId;

  List<_i2.OrderItem> items;

  String status;

  DateTime createdAt;

  Order copyWith({
    int? id,
    int? shopId,
    int? dealerId,
    List<_i2.OrderItem>? items,
    String? status,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'shopId': shopId,
      'dealerId': dealerId,
      'items': items.toJson(valueToJson: (v) => v.toJson()),
      'status': status,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OrderImpl extends Order {
  _OrderImpl({
    int? id,
    required int shopId,
    required int dealerId,
    required List<_i2.OrderItem> items,
    required String status,
    required DateTime createdAt,
  }) : super._(
          id: id,
          shopId: shopId,
          dealerId: dealerId,
          items: items,
          status: status,
          createdAt: createdAt,
        );

  @override
  Order copyWith({
    Object? id = _Undefined,
    int? shopId,
    int? dealerId,
    List<_i2.OrderItem>? items,
    String? status,
    DateTime? createdAt,
  }) {
    return Order(
      id: id is int? ? id : this.id,
      shopId: shopId ?? this.shopId,
      dealerId: dealerId ?? this.dealerId,
      items: items ?? this.items.map((e0) => e0.copyWith()).toList(),
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
