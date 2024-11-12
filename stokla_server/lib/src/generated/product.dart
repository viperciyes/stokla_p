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

abstract class Product extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Product._({
    int? id,
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
  }) : super(id);

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

  static final t = ProductTable();

  static const db = ProductRepository._();

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

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static ProductInclude include() {
    return ProductInclude._();
  }

  static ProductIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    ProductInclude? include,
  }) {
    return ProductIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Product.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Product.t),
      include: include,
    );
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

class ProductTable extends _i1.Table {
  ProductTable({super.tableRelation}) : super(tableName: 'products') {
    dealerId = _i1.ColumnInt(
      'dealerId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    isVisible = _i1.ColumnBool(
      'isVisible',
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

  late final _i1.ColumnInt dealerId;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnBool isVisible;

  late final _i1.ColumnBool isApproved;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnBool isDeleted;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime deletedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        dealerId,
        name,
        description,
        price,
        imageUrl,
        isVisible,
        isApproved,
        isActive,
        isDeleted,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}

class ProductInclude extends _i1.IncludeObject {
  ProductInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Product.t;
}

class ProductIncludeList extends _i1.IncludeList {
  ProductIncludeList._({
    _i1.WhereExpressionBuilder<ProductTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Product.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Product.t;
}

class ProductRepository {
  const ProductRepository._();

  Future<List<Product>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Product?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Product?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Product>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Product>> insert(
    _i1.Session session,
    List<Product> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Product>(
      rows,
      transaction: transaction,
    );
  }

  Future<Product> insertRow(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Product>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Product>> update(
    _i1.Session session,
    List<Product> rows, {
    _i1.ColumnSelections<ProductTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Product>(
      rows,
      columns: columns?.call(Product.t),
      transaction: transaction,
    );
  }

  Future<Product> updateRow(
    _i1.Session session,
    Product row, {
    _i1.ColumnSelections<ProductTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Product>(
      row,
      columns: columns?.call(Product.t),
      transaction: transaction,
    );
  }

  Future<List<Product>> delete(
    _i1.Session session,
    List<Product> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Product>(
      rows,
      transaction: transaction,
    );
  }

  Future<Product> deleteRow(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Product>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Product>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Product>(
      where: where(Product.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Product>(
      where: where?.call(Product.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
