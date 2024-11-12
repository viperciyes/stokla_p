import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_flutter/src/common/providers/order_provider.dart';
import 'package:stokla_flutter/src/dealer/screens/order_detail.dart';
import 'package:stokla_flutter/src/dealer/widgets/order_list_item.dart';

class OrderManagementScreen extends ConsumerStatefulWidget {
  const OrderManagementScreen({super.key});

  @override
  OrderManagementScreenState createState() => OrderManagementScreenState();
}

class OrderManagementScreenState extends ConsumerState<OrderManagementScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref
        .read(orderProvider.notifier)
        .fetchOrdersForDealer(0)); //todo: get dealer id and correct.
  }

  @override
  Widget build(BuildContext context) {
    final orders = ref.watch(orderProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Manage Orders')),
      body: orders.when(
        data: (orders) => ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return OrderListItem(
              order: order,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailScreen(orderId: order.id!),
                  ),
                );
              },
              onUpdateStatus: (newStatus) {
                ref
                    .read(orderProvider.notifier)
                    .updateOrderStatus(order.id!, newStatus);
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
