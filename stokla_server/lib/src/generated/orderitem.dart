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

abstract class OrderItem extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  OrderItem._({
    int? id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.price,
  }) : super(id);

  factory OrderItem({
    int? id,
    required int orderId,
    required int productId,
    required int quantity,
    required double price,
  }) = _OrderItemImpl;

  factory OrderItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return OrderItem(
      id: jsonSerialization['id'] as int?,
      orderId: jsonSerialization['orderId'] as int,
      productId: jsonSerialization['productId'] as int,
      quantity: jsonSerialization['quantity'] as int,
      price: (jsonSerialization['price'] as num).toDouble(),
    );
  }

  static final t = OrderItemTable();

  static const db = OrderItemRepository._();

  int orderId;

  int productId;

  int quantity;

  double price;

  @override
  _i1.Table get table => t;

  OrderItem copyWith({
    int? id,
    int? orderId,
    int? productId,
    int? quantity,
    double? price,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'orderId': orderId,
      'productId': productId,
      'quantity': quantity,
      'price': price,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'orderId': orderId,
      'productId': productId,
      'quantity': quantity,
      'price': price,
    };
  }

  static OrderItemInclude include() {
    return OrderItemInclude._();
  }

  static OrderItemIncludeList includeList({
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderItemTable>? orderByList,
    OrderItemInclude? include,
  }) {
    return OrderItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OrderItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(OrderItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OrderItemImpl extends OrderItem {
  _OrderItemImpl({
    int? id,
    required int orderId,
    required int productId,
    required int quantity,
    required double price,
  }) : super._(
          id: id,
          orderId: orderId,
          productId: productId,
          quantity: quantity,
          price: price,
        );

  @override
  OrderItem copyWith({
    Object? id = _Undefined,
    int? orderId,
    int? productId,
    int? quantity,
    double? price,
  }) {
    return OrderItem(
      id: id is int? ? id : this.id,
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}

class OrderItemTable extends _i1.Table {
  OrderItemTable({super.tableRelation}) : super(tableName: 'order_items') {
    orderId = _i1.ColumnInt(
      'orderId',
      this,
    );
    productId = _i1.ColumnInt(
      'productId',
      this,
    );
    quantity = _i1.ColumnInt(
      'quantity',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
  }

  late final _i1.ColumnInt orderId;

  late final _i1.ColumnInt productId;

  late final _i1.ColumnInt quantity;

  late final _i1.ColumnDouble price;

  @override
  List<_i1.Column> get columns => [
        id,
        orderId,
        productId,
        quantity,
        price,
      ];
}

class OrderItemInclude extends _i1.IncludeObject {
  OrderItemInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => OrderItem.t;
}

class OrderItemIncludeList extends _i1.IncludeList {
  OrderItemIncludeList._({
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(OrderItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => OrderItem.t;
}

class OrderItemRepository {
  const OrderItemRepository._();

  Future<List<OrderItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<OrderItem>(
      where: where?.call(OrderItem.t),
      orderBy: orderBy?.call(OrderItem.t),
      orderByList: orderByList?.call(OrderItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<OrderItem?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<OrderItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<OrderItem>(
      where: where?.call(OrderItem.t),
      orderBy: orderBy?.call(OrderItem.t),
      orderByList: orderByList?.call(OrderItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<OrderItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<OrderItem>(
      id,
      transaction: transaction,
    );
  }

  Future<List<OrderItem>> insert(
    _i1.Session session,
    List<OrderItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<OrderItem>(
      rows,
      transaction: transaction,
    );
  }

  Future<OrderItem> insertRow(
    _i1.Session session,
    OrderItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<OrderItem>(
      row,
      transaction: transaction,
    );
  }

  Future<List<OrderItem>> update(
    _i1.Session session,
    List<OrderItem> rows, {
    _i1.ColumnSelections<OrderItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<OrderItem>(
      rows,
      columns: columns?.call(OrderItem.t),
      transaction: transaction,
    );
  }

  Future<OrderItem> updateRow(
    _i1.Session session,
    OrderItem row, {
    _i1.ColumnSelections<OrderItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<OrderItem>(
      row,
      columns: columns?.call(OrderItem.t),
      transaction: transaction,
    );
  }

  Future<List<OrderItem>> delete(
    _i1.Session session,
    List<OrderItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OrderItem>(
      rows,
      transaction: transaction,
    );
  }

  Future<OrderItem> deleteRow(
    _i1.Session session,
    OrderItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<OrderItem>(
      row,
      transaction: transaction,
    );
  }

  Future<List<OrderItem>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OrderItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<OrderItem>(
      where: where(OrderItem.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<OrderItem>(
      where: where?.call(OrderItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
