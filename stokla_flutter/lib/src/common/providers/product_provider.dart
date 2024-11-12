import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_client/stokla_client.dart';
import 'package:stokla_flutter/src/common/providers/api_provider.dart';
import 'package:stokla_flutter/src/services/api_service.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  final ApiService _apiService;

  ProductNotifier(this._apiService) : super([]);

  Future<void> fetchProducts() async {
    try {
      final products = await _apiService.getAllProducts();
      state = products;
    } catch (e) {
      debugPrint('Error fetching products: $e');
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      final newProduct = await _apiService.createProduct(product);
      state = [...state, newProduct];
    } catch (e) {
      debugPrint('Error adding product: $e');
    }
  }

  Future<void> updateProduct(Product product) async {
    try {
      final updatedProduct = await _apiService.updateProduct(product);
      state = state
          .map((p) => p.id == updatedProduct.id ? updatedProduct : p)
          .toList();
    } catch (e) {
      debugPrint('Error updating product: $e');
    }
  }

  Future<void> deleteProduct(int productId) async {
    try {
      await _apiService.deleteProduct(productId);
      state = state.where((p) => p.id != productId).toList();
    } catch (e) {
      debugPrint('Error deleting product: $e');
    }
  }

  Future<void> fetchProductsByDealerId(int dealerId) async {
    try {
      final products = await _apiService.getProductsByDealerId(dealerId);
      state = products;
    } catch (e) {
      debugPrint('Error fetching products for dealer: $e');
    }
  }
}

final productProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ProductNotifier(apiService);
});

final productByIdProvider =
    FutureProvider.family<Product, int>((ref, productId) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getProductById(productId);
});
