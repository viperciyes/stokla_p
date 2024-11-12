import 'package:flutter/material.dart';
import 'package:stokla_client/stokla_client.dart';

class OrderListItem extends StatelessWidget {
  final Order order;
  final VoidCallback onTap;
  final Function(String) onUpdateStatus;

  const OrderListItem({
    super.key,
    required this.order,
    required this.onTap,
    required this.onUpdateStatus,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Order #${order.id}'),
      subtitle: Text('Status: ${order.status}'),
      trailing: Text('Status: ${order.status}'),
      onTap: onTap,
    );
  }
}
