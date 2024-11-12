import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_client/stokla_client.dart';
import 'package:stokla_flutter/src/common/providers/api_provider.dart';
import 'package:stokla_flutter/src/services/api_service.dart';

class ShopNotifier extends StateNotifier<AsyncValue<List<Shop>>> {
  final ApiService _apiService;

  ShopNotifier(this._apiService) : super(const AsyncValue.loading());

  Future<void> fetchShops() async {
    state = const AsyncValue.loading();
    try {
      final shops = await _apiService.getAllShops();
      state = AsyncValue.data(shops);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      debugPrint('Error fetching shops: $e');
    }
  }

  Future<void> addShop(Shop shop) async {
    try {
      final newShop = await _apiService.createShop(shop);
      state.whenData((shops) => state = AsyncValue.data([...shops, newShop]));
    } catch (e) {
      debugPrint('Error adding shop: $e');
    }
  }

  Future<void> updateShop(Shop shop) async {
    try {
      final updatedShop = await _apiService.updateShop(shop);
      state.whenData((shops) => state = AsyncValue.data(
          shops.map((s) => s.id == updatedShop.id ? updatedShop : s).toList()));
    } catch (e) {
      debugPrint('Error updating shop: $e');
    }
  }

  Future<void> deleteShop(int shopId) async {
    try {
      await _apiService.deleteShop(shopId);
      state.whenData((shops) =>
          state = AsyncValue.data(shops.where((s) => s.id != shopId).toList()));
    } catch (e) {
      debugPrint('Error deleting shop: $e');
    }
  }

  Future<Shop?> getShopById(int shopId) async {
    try {
      return await _apiService.getShopById(shopId);
    } catch (e) {
      debugPrint('Error fetching shop: $e');
      return null;
    }
  }
}

final shopProvider =
    StateNotifierProvider<ShopNotifier, AsyncValue<List<Shop>>>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ShopNotifier(apiService);
});
