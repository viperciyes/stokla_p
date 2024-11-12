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

abstract class City extends _i1.TableRow implements _i1.ProtocolSerialization {
  City._({
    int? id,
    required this.name,
    required this.country,
    required this.countryCode,
    required this.cityCode,
  }) : super(id);

  factory City({
    int? id,
    required String name,
    required String country,
    required String countryCode,
    required int cityCode,
  }) = _CityImpl;

  factory City.fromJson(Map<String, dynamic> jsonSerialization) {
    return City(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      country: jsonSerialization['country'] as String,
      countryCode: jsonSerialization['countryCode'] as String,
      cityCode: jsonSerialization['cityCode'] as int,
    );
  }

  static final t = CityTable();

  static const db = CityRepository._();

  String name;

  String country;

  String countryCode;

  int cityCode;

  @override
  _i1.Table get table => t;

  City copyWith({
    int? id,
    String? name,
    String? country,
    String? countryCode,
    int? cityCode,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'country': country,
      'countryCode': countryCode,
      'cityCode': cityCode,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'country': country,
      'countryCode': countryCode,
      'cityCode': cityCode,
    };
  }

  static CityInclude include() {
    return CityInclude._();
  }

  static CityIncludeList includeList({
    _i1.WhereExpressionBuilder<CityTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CityTable>? orderByList,
    CityInclude? include,
  }) {
    return CityIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(City.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(City.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CityImpl extends City {
  _CityImpl({
    int? id,
    required String name,
    required String country,
    required String countryCode,
    required int cityCode,
  }) : super._(
          id: id,
          name: name,
          country: country,
          countryCode: countryCode,
          cityCode: cityCode,
        );

  @override
  City copyWith({
    Object? id = _Undefined,
    String? name,
    String? country,
    String? countryCode,
    int? cityCode,
  }) {
    return City(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      cityCode: cityCode ?? this.cityCode,
    );
  }
}

class CityTable extends _i1.Table {
  CityTable({super.tableRelation}) : super(tableName: 'cities') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    country = _i1.ColumnString(
      'country',
      this,
    );
    countryCode = _i1.ColumnString(
      'countryCode',
      this,
    );
    cityCode = _i1.ColumnInt(
      'cityCode',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString country;

  late final _i1.ColumnString countryCode;

  late final _i1.ColumnInt cityCode;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        country,
        countryCode,
        cityCode,
      ];
}

class CityInclude extends _i1.IncludeObject {
  CityInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => City.t;
}

class CityIncludeList extends _i1.IncludeList {
  CityIncludeList._({
    _i1.WhereExpressionBuilder<CityTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(City.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => City.t;
}

class CityRepository {
  const CityRepository._();

  Future<List<City>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CityTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CityTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<City>(
      where: where?.call(City.t),
      orderBy: orderBy?.call(City.t),
      orderByList: orderByList?.call(City.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<City?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CityTable>? where,
    int? offset,
    _i1.OrderByBuilder<CityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CityTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<City>(
      where: where?.call(City.t),
      orderBy: orderBy?.call(City.t),
      orderByList: orderByList?.call(City.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<City?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<City>(
      id,
      transaction: transaction,
    );
  }

  Future<List<City>> insert(
    _i1.Session session,
    List<City> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<City>(
      rows,
      transaction: transaction,
    );
  }

  Future<City> insertRow(
    _i1.Session session,
    City row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<City>(
      row,
      transaction: transaction,
    );
  }

  Future<List<City>> update(
    _i1.Session session,
    List<City> rows, {
    _i1.ColumnSelections<CityTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<City>(
      rows,
      columns: columns?.call(City.t),
      transaction: transaction,
    );
  }

  Future<City> updateRow(
    _i1.Session session,
    City row, {
    _i1.ColumnSelections<CityTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<City>(
      row,
      columns: columns?.call(City.t),
      transaction: transaction,
    );
  }

  Future<List<City>> delete(
    _i1.Session session,
    List<City> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<City>(
      rows,
      transaction: transaction,
    );
  }

  Future<City> deleteRow(
    _i1.Session session,
    City row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<City>(
      row,
      transaction: transaction,
    );
  }

  Future<List<City>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CityTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<City>(
      where: where(City.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CityTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<City>(
      where: where?.call(City.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
