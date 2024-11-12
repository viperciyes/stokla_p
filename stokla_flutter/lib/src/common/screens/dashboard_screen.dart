import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_flutter/src/common/providers/user_provider.dart';

class DashboardScreen extends ConsumerWidget {
  final String userRole;

  const DashboardScreen({super.key, required this.userRole});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).value;

    return Scaffold(
      appBar: AppBar(
        title: Text('${userRole.capitalize()} Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              ref.read(userProvider.notifier).logout();
              Navigator.of(context).pushReplacementNamed('/signin');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${user?.name ?? 'User'}!'),
            const SizedBox(height: 20),
            Text('Your role: ${userRole.capitalize()}'),
            // Add more dashboard content here based on the user role
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
