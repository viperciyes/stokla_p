import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_client/stokla_client.dart';
import 'package:stokla_flutter/src/common/providers/api_provider.dart';
import 'package:stokla_flutter/src/services/api_service.dart';

class DealerNotifier extends StateNotifier<List<Dealer>> {
  final ApiService _apiService;

  DealerNotifier(this._apiService) : super([]);

  Future<void> fetchDealers() async {
    try {
      final dealers = await _apiService.getAllDealers();
      state = dealers;
    } catch (e) {
      // Handle error (e.g., show error message)
      debugPrint('Error fetching dealers: $e');
    }
  }

  Future<void> addDealer(Dealer dealer) async {
    try {
      final newDealer = await _apiService.createDealer(dealer);
      state = [...state, newDealer];
    } catch (e) {
      debugPrint('Error adding dealer: $e');
    }
  }

  Future<void> updateDealer(Dealer dealer) async {
    try {
      final updatedDealer = await _apiService.updateDealer(dealer);
      state = state
          .map((d) => d.id == updatedDealer.id ? updatedDealer : d)
          .toList();
    } catch (e) {
      debugPrint('Error updating dealer: $e');
    }
  }

  Future<void> deleteDealer(int dealerId) async {
    try {
      await _apiService.deleteDealer(dealerId);
      state = state.where((d) => d.id != dealerId).toList();
    } catch (e) {
      debugPrint('Error deleting dealer: $e');
    }
  }
}

final dealerProvider =
    StateNotifierProvider<DealerNotifier, List<Dealer>>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return DealerNotifier(apiService);
});
