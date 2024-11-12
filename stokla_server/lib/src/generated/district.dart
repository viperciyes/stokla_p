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

abstract class District extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  District._({
    int? id,
    required this.cityId,
    required this.name,
  }) : super(id);

  factory District({
    int? id,
    required int cityId,
    required String name,
  }) = _DistrictImpl;

  factory District.fromJson(Map<String, dynamic> jsonSerialization) {
    return District(
      id: jsonSerialization['id'] as int?,
      cityId: jsonSerialization['cityId'] as int,
      name: jsonSerialization['name'] as String,
    );
  }

  static final t = DistrictTable();

  static const db = DistrictRepository._();

  int cityId;

  String name;

  @override
  _i1.Table get table => t;

  District copyWith({
    int? id,
    int? cityId,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'cityId': cityId,
      'name': name,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'cityId': cityId,
      'name': name,
    };
  }

  static DistrictInclude include() {
    return DistrictInclude._();
  }

  static DistrictIncludeList includeList({
    _i1.WhereExpressionBuilder<DistrictTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DistrictTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DistrictTable>? orderByList,
    DistrictInclude? include,
  }) {
    return DistrictIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(District.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(District.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DistrictImpl extends District {
  _DistrictImpl({
    int? id,
    required int cityId,
    required String name,
  }) : super._(
          id: id,
          cityId: cityId,
          name: name,
        );

  @override
  District copyWith({
    Object? id = _Undefined,
    int? cityId,
    String? name,
  }) {
    return District(
      id: id is int? ? id : this.id,
      cityId: cityId ?? this.cityId,
      name: name ?? this.name,
    );
  }
}

class DistrictTable extends _i1.Table {
  DistrictTable({super.tableRelation}) : super(tableName: 'districts') {
    cityId = _i1.ColumnInt(
      'cityId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final _i1.ColumnInt cityId;

  late final _i1.ColumnString name;

  @override
  List<_i1.Column> get columns => [
        id,
        cityId,
        name,
      ];
}

class DistrictInclude extends _i1.IncludeObject {
  DistrictInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => District.t;
}

class DistrictIncludeList extends _i1.IncludeList {
  DistrictIncludeList._({
    _i1.WhereExpressionBuilder<DistrictTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(District.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => District.t;
}

class DistrictRepository {
  const DistrictRepository._();

  Future<List<District>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DistrictTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DistrictTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DistrictTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<District>(
      where: where?.call(District.t),
      orderBy: orderBy?.call(District.t),
      orderByList: orderByList?.call(District.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<District?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DistrictTable>? where,
    int? offset,
    _i1.OrderByBuilder<DistrictTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DistrictTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<District>(
      where: where?.call(District.t),
      orderBy: orderBy?.call(District.t),
      orderByList: orderByList?.call(District.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<District?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<District>(
      id,
      transaction: transaction,
    );
  }

  Future<List<District>> insert(
    _i1.Session session,
    List<District> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<District>(
      rows,
      transaction: transaction,
    );
  }

  Future<District> insertRow(
    _i1.Session session,
    District row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<District>(
      row,
      transaction: transaction,
    );
  }

  Future<List<District>> update(
    _i1.Session session,
    List<District> rows, {
    _i1.ColumnSelections<DistrictTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<District>(
      rows,
      columns: columns?.call(District.t),
      transaction: transaction,
    );
  }

  Future<District> updateRow(
    _i1.Session session,
    District row, {
    _i1.ColumnSelections<DistrictTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<District>(
      row,
      columns: columns?.call(District.t),
      transaction: transaction,
    );
  }

  Future<List<District>> delete(
    _i1.Session session,
    List<District> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<District>(
      rows,
      transaction: transaction,
    );
  }

  Future<District> deleteRow(
    _i1.Session session,
    District row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<District>(
      row,
      transaction: transaction,
    );
  }

  Future<List<District>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DistrictTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<District>(
      where: where(District.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DistrictTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<District>(
      where: where?.call(District.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
