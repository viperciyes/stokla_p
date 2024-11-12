import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_flutter/src/admin/screens/admin_dashboard.dart';
import 'package:stokla_flutter/src/common/screens/error_page.dart';
import 'package:stokla_flutter/src/common/screens/role_selection.dart';
import 'package:stokla_flutter/src/common/screens/sign_in.dart';
import 'package:stokla_flutter/src/dealer/screens/dealer_dashboard.dart';
import 'package:stokla_flutter/src/serverpod_client.dart';
import 'package:stokla_flutter/src/common/providers/user_provider.dart';
import 'package:stokla_flutter/src/common/screens/loading_screen.dart';
import 'package:stokla_flutter/src/shop/screens/shop_dashboard.dart';

class AuthWrapper extends ConsumerStatefulWidget {
  const AuthWrapper({super.key});

  @override
  AuthWrapperState createState() => AuthWrapperState();
}

class AuthWrapperState extends ConsumerState<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    debugPrint('AuthWrapper: initState called');
    debugPrint(
        'AuthWrapper: Initial isSignedIn state: ${sessionManager.isSignedIn}');
    sessionManager.addListener(_onSessionStateChanged);
    debugPrint('AuthWrapper: Listener added to sessionManager');
  }

  @override
  void dispose() {
    // Remove listener when the widget is disposed
    sessionManager.removeListener(_onSessionStateChanged);
    super.dispose();
  }

  void _onSessionStateChanged() {
    debugPrint('AuthWrapper: Session state changed');
    debugPrint(
        'AuthWrapper: New isSignedIn state: ${sessionManager.isSignedIn}');
    setState(() {
      debugPrint('AuthWrapper: setState called in _onSessionStateChanged');
    });
    if (sessionManager.isSignedIn) {
      debugPrint('AuthWrapper: User is signed in, calling _checkUserState');
      _checkUserState();
    } else {
      debugPrint('AuthWrapper: User is not signed in');
    }
  }

  Future<void> _checkUserState() async {
    debugPrint('AuthWrapper: _checkUserState called');
    final userId = sessionManager.signedInUser?.id;
    debugPrint('AuthWrapper: Signed in user ID: $userId');
    if (userId != null) {
      final userNotifier = ref.read(userProvider.notifier);
      debugPrint('AuthWrapper: Fetching user data for ID: $userId');
      await userNotifier.fetchUser(userId);
    } else {
      debugPrint('AuthWrapper: Error: Signed in user has no ID');
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AuthWrapper: build method called');
    debugPrint(
        'AuthWrapper: Current isSignedIn state: ${sessionManager.isSignedIn}');

    final userState = ref.watch(userProvider);
    debugPrint('AuthWrapper: Current userState: $userState');

    if (!sessionManager.isSignedIn) {
      debugPrint('AuthWrapper: Returning SignInPage');
      return const SignInPage();
    }

    return userState.when(
      loading: () {
        debugPrint('AuthWrapper: Returning LoadingScreen');
        return const LoadingScreen();
      },
      error: (error, _) {
        debugPrint('AuthWrapper: Error state - $error');
        // If the error is "user not found", we should go to role selection
        if (error.toString().contains('user not found')) {
          debugPrint(
              'AuthWrapper: New user detected, returning RoleSelectionScreen');
          return const RoleSelectionScreen();
        }
        return ErrorPage(error: error.toString());
      },
      data: (user) {
        if (user == null) {
          debugPrint(
              'AuthWrapper: User is null, returning RoleSelectionScreen');
          return const RoleSelectionScreen();
        } else if (!user.isCompleted) {
          debugPrint(
              'AuthWrapper: User profile incomplete, returning RoleSelectionScreen');
          return const RoleSelectionScreen();
        } else {
          debugPrint(
              'AuthWrapper: User profile complete, returning dashboard for role: ${user.role}');
          return _getHomepageByRole(user.role);
        }
      },
    );
  }

  Widget _getHomepageByRole(String role) {
    switch (role) {
      case 'dealer':
        return const DealerDashboardScreen();
      case 'shop':
        return const ShopDashboardScreen();
      case 'admin':
        return const AdminDashboard();
      default:
        return const Scaffold(body: Center(child: Text('Unknown user role')));
    }
  }
}
