// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_flutter/src/common/providers/dealer_provider.dart';
import 'package:stokla_flutter/src/dealer/screens/order_management.dart';
import 'package:stokla_flutter/src/dealer/screens/product_management.dart';

class DealerDashboardScreen extends ConsumerWidget {
  const DealerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dealer = ref.watch(dealerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dealer Dashboard')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Manage Products'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProductManagementScreen()),
            ),
          ),
          ListTile(
            title: const Text('Manage Orders'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const OrderManagementScreen()),
            ),
          ),
          // Add more dashboard options as needed
        ],
      ),
    );
  }
}
