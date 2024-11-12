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

abstract class Dealer extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Dealer._({
    int? id,
    required this.userId,
    required this.businessName,
    required this.deliveryAreaIds,
    required this.isApproved,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  }) : super(id);

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

  static final t = DealerTable();

  static const db = DealerRepository._();

  int userId;

  String businessName;

  List<int> deliveryAreaIds;

  bool isApproved;

  bool isActive;

  bool isDeleted;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime deletedAt;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static DealerInclude include() {
    return DealerInclude._();
  }

  static DealerIncludeList includeList({
    _i1.WhereExpressionBuilder<DealerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DealerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DealerTable>? orderByList,
    DealerInclude? include,
  }) {
    return DealerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Dealer.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Dealer.t),
      include: include,
    );
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

class DealerTable extends _i1.Table {
  DealerTable({super.tableRelation}) : super(tableName: 'dealers') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    businessName = _i1.ColumnString(
      'businessName',
      this,
    );
    deliveryAreaIds = _i1.ColumnSerializable(
      'deliveryAreaIds',
      this,
    );
    isApproved = _i1.ColumnBool(
      'isApproved',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
    isDeleted = _i1.ColumnBool(
      'isDeleted',
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

  late final _i1.ColumnSerializable deliveryAreaIds;

  late final _i1.ColumnBool isApproved;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnBool isDeleted;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime deletedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        businessName,
        deliveryAreaIds,
        isApproved,
        isActive,
        isDeleted,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}

class DealerInclude extends _i1.IncludeObject {
  DealerInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Dealer.t;
}

class DealerIncludeList extends _i1.IncludeList {
  DealerIncludeList._({
    _i1.WhereExpressionBuilder<DealerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Dealer.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Dealer.t;
}

class DealerRepository {
  const DealerRepository._();

  Future<List<Dealer>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DealerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DealerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DealerTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Dealer>(
      where: where?.call(Dealer.t),
      orderBy: orderBy?.call(Dealer.t),
      orderByList: orderByList?.call(Dealer.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Dealer?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DealerTable>? where,
    int? offset,
    _i1.OrderByBuilder<DealerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DealerTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Dealer>(
      where: where?.call(Dealer.t),
      orderBy: orderBy?.call(Dealer.t),
      orderByList: orderByList?.call(Dealer.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Dealer?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Dealer>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Dealer>> insert(
    _i1.Session session,
    List<Dealer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Dealer>(
      rows,
      transaction: transaction,
    );
  }

  Future<Dealer> insertRow(
    _i1.Session session,
    Dealer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Dealer>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Dealer>> update(
    _i1.Session session,
    List<Dealer> rows, {
    _i1.ColumnSelections<DealerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Dealer>(
      rows,
      columns: columns?.call(Dealer.t),
      transaction: transaction,
    );
  }

  Future<Dealer> updateRow(
    _i1.Session session,
    Dealer row, {
    _i1.ColumnSelections<DealerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Dealer>(
      row,
      columns: columns?.call(Dealer.t),
      transaction: transaction,
    );
  }

  Future<List<Dealer>> delete(
    _i1.Session session,
    List<Dealer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Dealer>(
      rows,
      transaction: transaction,
    );
  }

  Future<Dealer> deleteRow(
    _i1.Session session,
    Dealer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Dealer>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Dealer>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DealerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Dealer>(
      where: where(Dealer.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DealerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Dealer>(
      where: where?.call(Dealer.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
