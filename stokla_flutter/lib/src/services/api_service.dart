import 'package:stokla_client/stokla_client.dart';
import 'package:stokla_flutter/src/common/utils/logger.dart';
import '../serverpod_client.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  // Helper method for error handling
  Future<T> _handleApiCall<T>(Future<T> Function() apiCall) async {
    try {
      return await apiCall();
    } catch (e) {
      Log.d(e.toString());
      // Log the error
      if (kDebugMode) {
        debugPrint('API Error: $e');
      }
      // Rethrow the error to be handled by the caller
      rethrow;
    }
  }

  // Dealer API Functions
  Future<List<Dealer>> getAllDealers() async {
    return _handleApiCall(() => client.dealer.getAllDealers());
  }

  Future<Dealer> createDealer(Dealer dealer) async {
    return _handleApiCall(() => client.dealer.createDealer(dealer));
  }

  Future<Dealer> updateDealer(Dealer dealer) async {
    return _handleApiCall(() async {
      final dealerRes = await client.dealer.updateDealer(dealer);
      Log.d(dealerRes.toString());
      return dealerRes;
    });
  }

  Future<void> deleteDealer(int dealerId) async {
    return _handleApiCall(() => client.dealer.deleteDealer(dealerId));
  }

  // Product API Functions
  Future<List<Product>> getAllProducts() async {
    return _handleApiCall(() => client.product.getAllProducts());
  }

  Future<Product> getProductById(int productId) async {
    return _handleApiCall(() => client.product.getProductById(productId));
  }

  Future<Product> createProduct(Product product) async {
    return _handleApiCall(() => client.product.createProduct(product));
  }

  Future<Product> updateProduct(Product product) async {
    return _handleApiCall(() => client.product.updateProduct(product));
  }

  Future<void> deleteProduct(int productId) async {
    return _handleApiCall(() => client.product.deleteProduct(productId));
  }

  Future<List<Product>> getProductsByDealerId(int dealerId) async {
    return _handleApiCall(() => client.product.getProductsByDealerId(dealerId));
  }

  // Order API Functions
  Future<List<Order>> getOrdersForDealer(int dealerId) async {
    return _handleApiCall(() => client.order.getOrdersForDealer(dealerId));
  }

  Future<Order> createOrder(Order order) async {
    return _handleApiCall(() => client.order.createOrder(order));
  }

  Future<Order> getOrderById(int orderId) async {
    return _handleApiCall(() => client.order.getOrderById(orderId));
  }

  Future<Order> updateOrderStatus(int orderId, String newStatus) async {
    return _handleApiCall(
        () => client.order.updateOrderStatus(orderId, newStatus));
  }

  // Shop API Functions
  Future<List<Shop>> getAllShops() async {
    return _handleApiCall(() => client.shop.getAllShops());
  }

  Future<Shop> createShop(Shop shop) async {
    return _handleApiCall(() => client.shop.createShop(shop));
  }

  Future<Shop> updateShop(Shop shop) async {
    return _handleApiCall(() => client.shop.updateShop(shop));
  }

  Future<void> deleteShop(int shopId) async {
    return _handleApiCall(() => client.shop.deleteShop(shopId));
  }

  Future<Shop> getShopById(int shopId) async {
    return _handleApiCall(() => client.shop.getShopById(shopId));
  }

  // User API Functions
  Future<User> createUser(User user) async {
    return _handleApiCall(() => client.user.createUser(user));
  }

  Future<User?> getUserById(int userId) async {
    return _handleApiCall(() => client.user.getUserById(userId));
  }

  Future<User> updateUser(User user) async {
    return _handleApiCall(() => client.user.updateUser(user));
  }

  Future<void> deleteUser(int userId) async {
    return _handleApiCall(() => client.user.deleteUser(userId));
  }
}
