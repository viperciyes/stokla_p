import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_client/stokla_client.dart';
import 'package:stokla_flutter/src/common/providers/order_provider.dart';
import 'package:stokla_flutter/src/common/providers/product_provider.dart';
import 'package:stokla_flutter/src/common/providers/shop_provider.dart'; // Assume this exists
import 'package:stokla_flutter/src/dealer/widgets/order_status_update_dialog.dart';

class OrderDetailScreen extends ConsumerWidget {
  final int orderId;

  const OrderDetailScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsyncValue = ref.watch(orderProvider.select(
      (asyncOrders) => asyncOrders.whenData(
          (orders) => orders.firstWhere((order) => order.id == orderId)),
    ));

    return Scaffold(
      appBar: AppBar(title: const Text('Order Details')),
      body: orderAsyncValue.when(
        data: (order) => ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Text('Order ID: ${order.id}',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            Text('Status: ${order.status}'),
            const SizedBox(height: 16),
            Text('Order Items:',
                style: Theme.of(context).textTheme.titleMedium),
            ...order.items.map((item) => OrderItemWidget(item: item)),
            const SizedBox(height: 16),
            ShopDetailsWidget(shopId: order.shopId),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => OrderStatusUpdateDialog(
                    currentStatus: order.status,
                    onUpdate: (newStatus, message) {
                      ref
                          .read(orderProvider.notifier)
                          .updateOrderStatus(order.id!, newStatus);
                      // later: Implement sending notification with message
                    },
                  ),
                );
              },
              child: const Text('Update Order Status'),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            const Center(child: Text('Error loading order details')),
      ),
    );
  }
}

class OrderItemWidget extends ConsumerWidget {
  final OrderItem item;

  const OrderItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsyncValue = ref.watch(productByIdProvider(item.productId));

    return productAsyncValue.when(
      data: (product) => ListTile(
        title: Text(product.name),
        subtitle: Text('Quantity: ${item.quantity}'),
        trailing: Text('\$${product.price * item.quantity}'),
      ),
      loading: () => const ListTile(
        title: Text('Loading product details...'),
      ),
      error: (error, stack) => ListTile(
        title: Text('Error loading product (ID: ${item.productId})'),
        subtitle: Text('Error: $error'),
      ),
    );
  }
}

class ShopDetailsWidget extends ConsumerWidget {
  final int shopId;

  const ShopDetailsWidget({super.key, required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopAsyncValue = ref.watch(shopProvider.select(
      (asyncShops) => asyncShops.whenData(
        (shops) => shops.firstWhere((shop) => shop.id == shopId),
      ),
    ));

    return shopAsyncValue.when(
      data: (shop) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Shop Information:',
              style: Theme.of(context).textTheme.titleMedium),
          Text('Name: ${shop.businessName}'),
          Text('Address: ${shop.cityId}'),
          Text('Phone: ${shop.phone}'),
          Text('Email: ${shop.email}'),
        ],
      ),
      loading: () => const Center(child: Text('Getting shop details...')),
      error: (error, stack) =>
          const Center(child: Text('Error loading shop details')),
    );
  }
}
