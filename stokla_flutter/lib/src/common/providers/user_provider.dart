import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_client/stokla_client.dart';
import 'package:stokla_flutter/src/common/providers/api_provider.dart';
import 'package:stokla_flutter/src/serverpod_client.dart';
import 'package:stokla_flutter/src/services/api_service.dart';

class UserNotifier extends StateNotifier<AsyncValue<User?>> {
  final ApiService _apiService;

  UserNotifier(this._apiService) : super(const AsyncValue.loading()) {
    _initializeUser();
  }

  Future<void> _initializeUser() async {
    if (sessionManager.isSignedIn) {
      await fetchUser(sessionManager.signedInUser!.id!);
    } else {
      state = const AsyncValue.data(null);
    }
  }

  Future<User?> createUser(User user) async {
    state = const AsyncValue.loading();
    User? newUser;
    try {
      newUser = await _apiService.createUser(user);
      state = AsyncValue.data(newUser);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      debugPrint('Error creating user: $e');
    }

    return newUser;
  }

  Future<User?> fetchUser(int userId) async {
    //gets user from users table by serverpod userid
    User? user;
    try {
      user = await _apiService.getUserById(userId);
      if (user != null) {
        state = AsyncValue.data(user);
      } else {
        state = const AsyncValue.data(null);
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      debugPrint('Error fetching user: $e');
    }
    return user;
  }

  Future<void> updateUser(User user) async {
    state = const AsyncValue.loading();
    try {
      final updatedUser = await _apiService.updateUser(user);
      state = AsyncValue.data(updatedUser);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      debugPrint('Error updating user: $e');
    }
  }

  bool isProfileComplete(User? user) {
    return user != null &&
        user.isCompleted &&
        user.name.isNotEmpty &&
        user.surname.isNotEmpty &&
        user.businessname.isNotEmpty &&
        user.businessphone.isNotEmpty &&
        user.mobilephone.isNotEmpty &&
        user.businessaddress.isNotEmpty &&
        user.taxno.isNotEmpty &&
        user.taxname.isNotEmpty;
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      await sessionManager.signOut();
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> refreshUser() async {
    if (sessionManager.isSignedIn) {
      await fetchUser(sessionManager.signedInUser!.id!);
    } else {
      state = const AsyncValue.data(null);
    }
  }
}

final userProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<User?>>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return UserNotifier(apiService);
});
