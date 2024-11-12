import 'package:flutter/material.dart';

class OrderStatusUpdateDialog extends StatefulWidget {
  final String currentStatus;
  final Function(String, String) onUpdate;

  const OrderStatusUpdateDialog({
    super.key,
    required this.currentStatus,
    required this.onUpdate,
  });

  @override
  OrderStatusUpdateDialogState createState() => OrderStatusUpdateDialogState();
}

class OrderStatusUpdateDialogState extends State<OrderStatusUpdateDialog> {
  late String _selectedStatus;
  String _message = '';

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.currentStatus;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Update Order Status'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            value: _selectedStatus,
            items: ['Awaiting', 'Received', 'Completed', 'Rejected']
                .map((status) => DropdownMenuItem(
                      value: status,
                      child: Text(status),
                    ))
                .toList(),
            onChanged: (value) => setState(() => _selectedStatus = value!),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
                labelText: 'Notification Message (Optional)'),
            onChanged: (value) => _message = value,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onUpdate(_selectedStatus, _message);
            Navigator.pop(context);
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
