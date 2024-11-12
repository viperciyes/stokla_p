/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'city.dart' as _i2;
import 'dealer.dart' as _i3;
import 'district.dart' as _i4;
import 'order.dart' as _i5;
import 'orderitem.dart' as _i6;
import 'product.dart' as _i7;
import 'shop.dart' as _i8;
import 'user.dart' as _i9;
import 'protocol.dart' as _i10;
import 'package:stokla_client/src/protocol/user.dart' as _i11;
import 'package:stokla_client/src/protocol/dealer.dart' as _i12;
import 'package:stokla_client/src/protocol/order.dart' as _i13;
import 'package:stokla_client/src/protocol/product.dart' as _i14;
import 'package:stokla_client/src/protocol/shop.dart' as _i15;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i16;
export 'city.dart';
export 'dealer.dart';
export 'district.dart';
export 'order.dart';
export 'orderitem.dart';
export 'product.dart';
export 'shop.dart';
export 'user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.City) {
      return _i2.City.fromJson(data) as T;
    }
    if (t == _i3.Dealer) {
      return _i3.Dealer.fromJson(data) as T;
    }
    if (t == _i4.District) {
      return _i4.District.fromJson(data) as T;
    }
    if (t == _i5.Order) {
      return _i5.Order.fromJson(data) as T;
    }
    if (t == _i6.OrderItem) {
      return _i6.OrderItem.fromJson(data) as T;
    }
    if (t == _i7.Product) {
      return _i7.Product.fromJson(data) as T;
    }
    if (t == _i8.Shop) {
      return _i8.Shop.fromJson(data) as T;
    }
    if (t == _i9.User) {
      return _i9.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.City?>()) {
      return (data != null ? _i2.City.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Dealer?>()) {
      return (data != null ? _i3.Dealer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.District?>()) {
      return (data != null ? _i4.District.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Order?>()) {
      return (data != null ? _i5.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.OrderItem?>()) {
      return (data != null ? _i6.OrderItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Product?>()) {
      return (data != null ? _i7.Product.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Shop?>()) {
      return (data != null ? _i8.Shop.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.User?>()) {
      return (data != null ? _i9.User.fromJson(data) : null) as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i10.OrderItem>) {
      return (data as List).map((e) => deserialize<_i10.OrderItem>(e)).toList()
          as dynamic;
    }
    if (t == List<_i11.User>) {
      return (data as List).map((e) => deserialize<_i11.User>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.Dealer>) {
      return (data as List).map((e) => deserialize<_i12.Dealer>(e)).toList()
          as dynamic;
    }
    if (t == List<_i13.Order>) {
      return (data as List).map((e) => deserialize<_i13.Order>(e)).toList()
          as dynamic;
    }
    if (t == List<_i14.Product>) {
      return (data as List).map((e) => deserialize<_i14.Product>(e)).toList()
          as dynamic;
    }
    if (t == List<_i15.Shop>) {
      return (data as List).map((e) => deserialize<_i15.Shop>(e)).toList()
          as dynamic;
    }
    try {
      return _i16.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.City) {
      return 'City';
    }
    if (data is _i3.Dealer) {
      return 'Dealer';
    }
    if (data is _i4.District) {
      return 'District';
    }
    if (data is _i5.Order) {
      return 'Order';
    }
    if (data is _i6.OrderItem) {
      return 'OrderItem';
    }
    if (data is _i7.Product) {
      return 'Product';
    }
    if (data is _i8.Shop) {
      return 'Shop';
    }
    if (data is _i9.User) {
      return 'User';
    }
    className = _i16.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'City') {
      return deserialize<_i2.City>(data['data']);
    }
    if (data['className'] == 'Dealer') {
      return deserialize<_i3.Dealer>(data['data']);
    }
    if (data['className'] == 'District') {
      return deserialize<_i4.District>(data['data']);
    }
    if (data['className'] == 'Order') {
      return deserialize<_i5.Order>(data['data']);
    }
    if (data['className'] == 'OrderItem') {
      return deserialize<_i6.OrderItem>(data['data']);
    }
    if (data['className'] == 'Product') {
      return deserialize<_i7.Product>(data['data']);
    }
    if (data['className'] == 'Shop') {
      return deserialize<_i8.Shop>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i9.User>(data['data']);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i16.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
