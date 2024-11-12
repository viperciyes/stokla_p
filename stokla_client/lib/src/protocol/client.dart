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
import 'dart:async' as _i2;
import 'package:stokla_client/src/protocol/user.dart' as _i3;
import 'package:stokla_client/src/protocol/dealer.dart' as _i4;
import 'package:stokla_client/src/protocol/order.dart' as _i5;
import 'package:stokla_client/src/protocol/product.dart' as _i6;
import 'package:stokla_client/src/protocol/shop.dart' as _i7;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i8;
import 'protocol.dart' as _i9;

/// {@category Endpoint}
class EndpointAdmin extends _i1.EndpointRef {
  EndpointAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';

  _i2.Future<String> createAdminUser(
    String email,
    String password,
    String name,
    String surname,
  ) =>
      caller.callServerEndpoint<String>(
        'admin',
        'createAdminUser',
        {
          'email': email,
          'password': password,
          'name': name,
          'surname': surname,
        },
      );

  _i2.Future<List<_i3.User>> getAllAdmins() =>
      caller.callServerEndpoint<List<_i3.User>>(
        'admin',
        'getAllAdmins',
        {},
      );

  _i2.Future<void> deleteAdmin(int userId) => caller.callServerEndpoint<void>(
        'admin',
        'deleteAdmin',
        {'userId': userId},
      );
}

/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';
}

/// {@category Endpoint}
class EndpointDealer extends _i1.EndpointRef {
  EndpointDealer(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'dealer';

  _i2.Future<List<_i4.Dealer>> getAllDealers() =>
      caller.callServerEndpoint<List<_i4.Dealer>>(
        'dealer',
        'getAllDealers',
        {},
      );

  _i2.Future<_i4.Dealer> createDealer(_i4.Dealer dealer) =>
      caller.callServerEndpoint<_i4.Dealer>(
        'dealer',
        'createDealer',
        {'dealer': dealer},
      );

  _i2.Future<void> deleteDealer(int dealerId) =>
      caller.callServerEndpoint<void>(
        'dealer',
        'deleteDealer',
        {'dealerId': dealerId},
      );

  _i2.Future<_i4.Dealer> updateDealer(_i4.Dealer dealer) =>
      caller.callServerEndpoint<_i4.Dealer>(
        'dealer',
        'updateDealer',
        {'dealer': dealer},
      );
}

/// {@category Endpoint}
class EndpointOrder extends _i1.EndpointRef {
  EndpointOrder(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'order';

  _i2.Future<List<_i5.Order>> getOrdersForDealer(int dealerId) =>
      caller.callServerEndpoint<List<_i5.Order>>(
        'order',
        'getOrdersForDealer',
        {'dealerId': dealerId},
      );

  _i2.Future<_i5.Order> getOrderById(int orderId) =>
      caller.callServerEndpoint<_i5.Order>(
        'order',
        'getOrderById',
        {'orderId': orderId},
      );

  _i2.Future<_i5.Order> createOrder(_i5.Order order) =>
      caller.callServerEndpoint<_i5.Order>(
        'order',
        'createOrder',
        {'order': order},
      );

  _i2.Future<_i5.Order> updateOrderStatus(
    int orderId,
    String newStatus,
  ) =>
      caller.callServerEndpoint<_i5.Order>(
        'order',
        'updateOrderStatus',
        {
          'orderId': orderId,
          'newStatus': newStatus,
        },
      );

  _i2.Future<void> deleteOrder(int orderId) => caller.callServerEndpoint<void>(
        'order',
        'deleteOrder',
        {'orderId': orderId},
      );
}

/// {@category Endpoint}
class EndpointProduct extends _i1.EndpointRef {
  EndpointProduct(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'product';

  _i2.Future<List<_i6.Product>> getAllProducts() =>
      caller.callServerEndpoint<List<_i6.Product>>(
        'product',
        'getAllProducts',
        {},
      );

  _i2.Future<List<_i6.Product>> getProductsByDealerId(int dealerId) =>
      caller.callServerEndpoint<List<_i6.Product>>(
        'product',
        'getProductsByDealerId',
        {'dealerId': dealerId},
      );

  _i2.Future<_i6.Product> getProductById(int productId) =>
      caller.callServerEndpoint<_i6.Product>(
        'product',
        'getProductById',
        {'productId': productId},
      );

  _i2.Future<_i6.Product> createProduct(_i6.Product product) =>
      caller.callServerEndpoint<_i6.Product>(
        'product',
        'createProduct',
        {'product': product},
      );

  _i2.Future<_i6.Product> updateProduct(_i6.Product product) =>
      caller.callServerEndpoint<_i6.Product>(
        'product',
        'updateProduct',
        {'product': product},
      );

  _i2.Future<void> deleteProduct(int productId) =>
      caller.callServerEndpoint<void>(
        'product',
        'deleteProduct',
        {'productId': productId},
      );
}

/// {@category Endpoint}
class EndpointShop extends _i1.EndpointRef {
  EndpointShop(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'shop';

  _i2.Future<_i7.Shop> createShop(_i7.Shop shop) =>
      caller.callServerEndpoint<_i7.Shop>(
        'shop',
        'createShop',
        {'shop': shop},
      );

  _i2.Future<_i7.Shop> updateShop(_i7.Shop shop) =>
      caller.callServerEndpoint<_i7.Shop>(
        'shop',
        'updateShop',
        {'shop': shop},
      );

  _i2.Future<void> deleteShop(int shopId) => caller.callServerEndpoint<void>(
        'shop',
        'deleteShop',
        {'shopId': shopId},
      );

  _i2.Future<_i7.Shop> getShopById(int shopId) =>
      caller.callServerEndpoint<_i7.Shop>(
        'shop',
        'getShopById',
        {'shopId': shopId},
      );

  _i2.Future<List<_i7.Shop>> getAllShops() =>
      caller.callServerEndpoint<List<_i7.Shop>>(
        'shop',
        'getAllShops',
        {},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<_i3.User> createUser(_i3.User user) =>
      caller.callServerEndpoint<_i3.User>(
        'user',
        'createUser',
        {'user': user},
      );

  _i2.Future<_i3.User?> getUserById(int userId) =>
      caller.callServerEndpoint<_i3.User?>(
        'user',
        'getUserById',
        {'userId': userId},
      );

  _i2.Future<_i3.User> updateUser(_i3.User user) =>
      caller.callServerEndpoint<_i3.User>(
        'user',
        'updateUser',
        {'user': user},
      );

  _i2.Future<void> deleteUser(int userId) => caller.callServerEndpoint<void>(
        'user',
        'deleteUser',
        {'userId': userId},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i8.Caller(client);
  }

  late final _i8.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i9.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    admin = EndpointAdmin(this);
    auth = EndpointAuth(this);
    dealer = EndpointDealer(this);
    order = EndpointOrder(this);
    product = EndpointProduct(this);
    shop = EndpointShop(this);
    user = EndpointUser(this);
    modules = _Modules(this);
  }

  late final EndpointAdmin admin;

  late final EndpointAuth auth;

  late final EndpointDealer dealer;

  late final EndpointOrder order;

  late final EndpointProduct product;

  late final EndpointShop shop;

  late final EndpointUser user;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'admin': admin,
        'auth': auth,
        'dealer': dealer,
        'order': order,
        'product': product,
        'shop': shop,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
