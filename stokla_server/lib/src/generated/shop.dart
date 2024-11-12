/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Shop extends _i1.TableRow implements _i1.ProtocolSerialization {
  Shop._({
    int? id,
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
  }) : super(id);

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

  static final t = ShopTable();

  static const db = ShopRepository._();

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

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static ShopInclude include() {
    return ShopInclude._();
  }

  static ShopIncludeList includeList({
    _i1.WhereExpressionBuilder<ShopTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ShopTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ShopTable>? orderByList,
    ShopInclude? include,
  }) {
    return ShopIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Shop.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Shop.t),
      include: include,
    );
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

class ShopTable extends _i1.Table {
  ShopTable({super.tableRelation}) : super(tableName: 'shops') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    businessName = _i1.ColumnString(
      'businessName',
      this,
    );
    cityId = _i1.ColumnInt(
      'cityId',
      this,
    );
    districtId = _i1.ColumnInt(
      'districtId',
      this,
    );
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString businessName;

  late final _i1.ColumnInt cityId;

  late final _i1.ColumnInt districtId;

  late final _i1.ColumnString phone;

  late final _i1.ColumnString email;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime deletedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        businessName,
        cityId,
        districtId,
        phone,
        email,
        isActive,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}

class ShopInclude extends _i1.IncludeObject {
  ShopInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Shop.t;
}

class ShopIncludeList extends _i1.IncludeList {
  ShopIncludeList._({
    _i1.WhereExpressionBuilder<ShopTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Shop.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Shop.t;
}

class ShopRepository {
  const ShopRepository._();

  Future<List<Shop>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ShopTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ShopTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ShopTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Shop>(
      where: where?.call(Shop.t),
      orderBy: orderBy?.call(Shop.t),
      orderByList: orderByList?.call(Shop.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Shop?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ShopTable>? where,
    int? offset,
    _i1.OrderByBuilder<ShopTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ShopTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Shop>(
      where: where?.call(Shop.t),
      orderBy: orderBy?.call(Shop.t),
      orderByList: orderByList?.call(Shop.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Shop?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Shop>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Shop>> insert(
    _i1.Session session,
    List<Shop> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Shop>(
      rows,
      transaction: transaction,
    );
  }

  Future<Shop> insertRow(
    _i1.Session session,
    Shop row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Shop>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Shop>> update(
    _i1.Session session,
    List<Shop> rows, {
    _i1.ColumnSelections<ShopTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Shop>(
      rows,
      columns: columns?.call(Shop.t),
      transaction: transaction,
    );
  }

  Future<Shop> updateRow(
    _i1.Session session,
    Shop row, {
    _i1.ColumnSelections<ShopTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Shop>(
      row,
      columns: columns?.call(Shop.t),
      transaction: transaction,
    );
  }

  Future<List<Shop>> delete(
    _i1.Session session,
    List<Shop> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Shop>(
      rows,
      transaction: transaction,
    );
  }

  Future<Shop> deleteRow(
    _i1.Session session,
    Shop row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Shop>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Shop>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ShopTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Shop>(
      where: where(Shop.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ShopTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Shop>(
      where: where?.call(Shop.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
