// ignore_for_file: unused_field

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_client/stokla_client.dart';
import 'package:stokla_flutter/src/common/providers/api_provider.dart';
import 'package:stokla_flutter/src/services/api_service.dart';

class AuthNotifier extends StateNotifier<User?> {
  final ApiService _apiService;

  AuthNotifier(this._apiService) : super(null);

  Future<void> login(String email, String password) async {
    // Implement login logic using _apiService
    // Update state with logged in user
  }

  Future<void> register(User user) async {
    // Implement registration logic
    // Update state with registered user
  }
  Future<void> updateUserData(User user) async {
    // Implement users table completion logic
    // Update state with registered user
  }

  void logout() {
    state = null;
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AuthNotifier(apiService);
});
