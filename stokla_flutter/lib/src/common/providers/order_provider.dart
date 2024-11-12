import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_client/stokla_client.dart';
import 'package:stokla_flutter/src/common/providers/api_provider.dart';
import 'package:stokla_flutter/src/services/api_service.dart';

class OrderNotifier extends StateNotifier<AsyncValue<List<Order>>> {
  final ApiService _apiService;

  OrderNotifier(this._apiService) : super(const AsyncValue.loading());

  Future<void> fetchOrdersForDealer(int dealerId) async {
    state = const AsyncValue.loading();
    try {
      final orders = await _apiService.getOrdersForDealer(dealerId);
      state = AsyncValue.data(orders);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      debugPrint('Error fetching orders for dealer: $e');
    }
  }

  Future<void> createOrder(Order order) async {
    try {
      final newOrder = await _apiService.createOrder(order);
      state
          .whenData((orders) => state = AsyncValue.data([...orders, newOrder]));
    } catch (e) {
      debugPrint('Error creating order: $e');
    }
  }

  Future<void> updateOrderStatus(int orderId, String newStatus) async {
    try {
      final updatedOrder =
          await _apiService.updateOrderStatus(orderId, newStatus);
      state.whenData((orders) => state = AsyncValue.data(orders
          .map((o) => o.id == updatedOrder.id ? updatedOrder : o)
          .toList()));
    } catch (e) {
      debugPrint('Error updating order status: $e');
    }
  }

  Future<Order?> getOrderById(int orderId) async {
    try {
      return await _apiService.getOrderById(orderId);
    } catch (e) {
      debugPrint('Error fetching order: $e');
      return null;
    }
  }
}

final orderProvider =
    StateNotifierProvider<OrderNotifier, AsyncValue<List<Order>>>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return OrderNotifier(apiService);
});
