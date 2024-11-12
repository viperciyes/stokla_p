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
import '../endpoints/admin_endpoint.dart' as _i2;
import '../endpoints/auth_endpoint.dart' as _i3;
import '../endpoints/dealer_endpoint.dart' as _i4;
import '../endpoints/order_endpoint.dart' as _i5;
import '../endpoints/product_endpoint.dart' as _i6;
import '../endpoints/shop_endpoint.dart' as _i7;
import '../endpoints/user_endpoint.dart' as _i8;
import 'package:stokla_server/src/generated/dealer.dart' as _i9;
import 'package:stokla_server/src/generated/order.dart' as _i10;
import 'package:stokla_server/src/generated/product.dart' as _i11;
import 'package:stokla_server/src/generated/shop.dart' as _i12;
import 'package:stokla_server/src/generated/user.dart' as _i13;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i14;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'admin': _i2.AdminEndpoint()
        ..initialize(
          server,
          'admin',
          null,
        ),
      'auth': _i3.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'dealer': _i4.DealerEndpoint()
        ..initialize(
          server,
          'dealer',
          null,
        ),
      'order': _i5.OrderEndpoint()
        ..initialize(
          server,
          'order',
          null,
        ),
      'product': _i6.ProductEndpoint()
        ..initialize(
          server,
          'product',
          null,
        ),
      'shop': _i7.ShopEndpoint()
        ..initialize(
          server,
          'shop',
          null,
        ),
      'user': _i8.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
    };
    connectors['admin'] = _i1.EndpointConnector(
      name: 'admin',
      endpoint: endpoints['admin']!,
      methodConnectors: {
        'createAdminUser': _i1.MethodConnector(
          name: 'createAdminUser',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'surname': _i1.ParameterDescription(
              name: 'surname',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).createAdminUser(
            session,
            params['email'],
            params['password'],
            params['name'],
            params['surname'],
          ),
        ),
        'getAllAdmins': _i1.MethodConnector(
          name: 'getAllAdmins',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).getAllAdmins(session),
        ),
        'deleteAdmin': _i1.MethodConnector(
          name: 'deleteAdmin',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).deleteAdmin(
            session,
            params['userId'],
          ),
        ),
      },
    );
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {},
    );
    connectors['dealer'] = _i1.EndpointConnector(
      name: 'dealer',
      endpoint: endpoints['dealer']!,
      methodConnectors: {
        'getAllDealers': _i1.MethodConnector(
          name: 'getAllDealers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dealer'] as _i4.DealerEndpoint)
                  .getAllDealers(session),
        ),
        'createDealer': _i1.MethodConnector(
          name: 'createDealer',
          params: {
            'dealer': _i1.ParameterDescription(
              name: 'dealer',
              type: _i1.getType<_i9.Dealer>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dealer'] as _i4.DealerEndpoint).createDealer(
            session,
            params['dealer'],
          ),
        ),
        'deleteDealer': _i1.MethodConnector(
          name: 'deleteDealer',
          params: {
            'dealerId': _i1.ParameterDescription(
              name: 'dealerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dealer'] as _i4.DealerEndpoint).deleteDealer(
            session,
            params['dealerId'],
          ),
        ),
        'updateDealer': _i1.MethodConnector(
          name: 'updateDealer',
          params: {
            'dealer': _i1.ParameterDescription(
              name: 'dealer',
              type: _i1.getType<_i9.Dealer>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dealer'] as _i4.DealerEndpoint).updateDealer(
            session,
            params['dealer'],
          ),
        ),
      },
    );
    connectors['order'] = _i1.EndpointConnector(
      name: 'order',
      endpoint: endpoints['order']!,
      methodConnectors: {
        'getOrdersForDealer': _i1.MethodConnector(
          name: 'getOrdersForDealer',
          params: {
            'dealerId': _i1.ParameterDescription(
              name: 'dealerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['order'] as _i5.OrderEndpoint).getOrdersForDealer(
            session,
            params['dealerId'],
          ),
        ),
        'getOrderById': _i1.MethodConnector(
          name: 'getOrderById',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['order'] as _i5.OrderEndpoint).getOrderById(
            session,
            params['orderId'],
          ),
        ),
        'createOrder': _i1.MethodConnector(
          name: 'createOrder',
          params: {
            'order': _i1.ParameterDescription(
              name: 'order',
              type: _i1.getType<_i10.Order>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['order'] as _i5.OrderEndpoint).createOrder(
            session,
            params['order'],
          ),
        ),
        'updateOrderStatus': _i1.MethodConnector(
          name: 'updateOrderStatus',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newStatus': _i1.ParameterDescription(
              name: 'newStatus',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['order'] as _i5.OrderEndpoint).updateOrderStatus(
            session,
            params['orderId'],
            params['newStatus'],
          ),
        ),
        'deleteOrder': _i1.MethodConnector(
          name: 'deleteOrder',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['order'] as _i5.OrderEndpoint).deleteOrder(
            session,
            params['orderId'],
          ),
        ),
      },
    );
    connectors['product'] = _i1.EndpointConnector(
      name: 'product',
      endpoint: endpoints['product']!,
      methodConnectors: {
        'getAllProducts': _i1.MethodConnector(
          name: 'getAllProducts',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i6.ProductEndpoint)
                  .getAllProducts(session),
        ),
        'getProductsByDealerId': _i1.MethodConnector(
          name: 'getProductsByDealerId',
          params: {
            'dealerId': _i1.ParameterDescription(
              name: 'dealerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i6.ProductEndpoint)
                  .getProductsByDealerId(
            session,
            params['dealerId'],
          ),
        ),
        'getProductById': _i1.MethodConnector(
          name: 'getProductById',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i6.ProductEndpoint).getProductById(
            session,
            params['productId'],
          ),
        ),
        'createProduct': _i1.MethodConnector(
          name: 'createProduct',
          params: {
            'product': _i1.ParameterDescription(
              name: 'product',
              type: _i1.getType<_i11.Product>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i6.ProductEndpoint).createProduct(
            session,
            params['product'],
          ),
        ),
        'updateProduct': _i1.MethodConnector(
          name: 'updateProduct',
          params: {
            'product': _i1.ParameterDescription(
              name: 'product',
              type: _i1.getType<_i11.Product>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i6.ProductEndpoint).updateProduct(
            session,
            params['product'],
          ),
        ),
        'deleteProduct': _i1.MethodConnector(
          name: 'deleteProduct',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i6.ProductEndpoint).deleteProduct(
            session,
            params['productId'],
          ),
        ),
      },
    );
    connectors['shop'] = _i1.EndpointConnector(
      name: 'shop',
      endpoint: endpoints['shop']!,
      methodConnectors: {
        'createShop': _i1.MethodConnector(
          name: 'createShop',
          params: {
            'shop': _i1.ParameterDescription(
              name: 'shop',
              type: _i1.getType<_i12.Shop>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['shop'] as _i7.ShopEndpoint).createShop(
            session,
            params['shop'],
          ),
        ),
        'updateShop': _i1.MethodConnector(
          name: 'updateShop',
          params: {
            'shop': _i1.ParameterDescription(
              name: 'shop',
              type: _i1.getType<_i12.Shop>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['shop'] as _i7.ShopEndpoint).updateShop(
            session,
            params['shop'],
          ),
        ),
        'deleteShop': _i1.MethodConnector(
          name: 'deleteShop',
          params: {
            'shopId': _i1.ParameterDescription(
              name: 'shopId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['shop'] as _i7.ShopEndpoint).deleteShop(
            session,
            params['shopId'],
          ),
        ),
        'getShopById': _i1.MethodConnector(
          name: 'getShopById',
          params: {
            'shopId': _i1.ParameterDescription(
              name: 'shopId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['shop'] as _i7.ShopEndpoint).getShopById(
            session,
            params['shopId'],
          ),
        ),
        'getAllShops': _i1.MethodConnector(
          name: 'getAllShops',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['shop'] as _i7.ShopEndpoint).getAllShops(session),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'createUser': _i1.MethodConnector(
          name: 'createUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i13.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i8.UserEndpoint).createUser(
            session,
            params['user'],
          ),
        ),
        'getUserById': _i1.MethodConnector(
          name: 'getUserById',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i8.UserEndpoint).getUserById(
            session,
            params['userId'],
          ),
        ),
        'updateUser': _i1.MethodConnector(
          name: 'updateUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i13.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i8.UserEndpoint).updateUser(
            session,
            params['user'],
          ),
        ),
        'deleteUser': _i1.MethodConnector(
          name: 'deleteUser',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i8.UserEndpoint).deleteUser(
            session,
            params['userId'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i14.Endpoints()..initializeEndpoints(server);
  }
}
