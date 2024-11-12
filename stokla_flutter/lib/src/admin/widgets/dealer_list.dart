import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_client/stokla_client.dart';
import 'package:stokla_flutter/src/common/providers/dealer_provider.dart';

class DealerList extends ConsumerWidget {
  final bool Function(Dealer) filter;
  final Function(Dealer, bool)? onChangeStatus;
  final Function(Dealer)? onApprove;
  final Function(Dealer)? onReject;

  const DealerList({
    super.key,
    required this.filter,
    this.onChangeStatus,
    this.onApprove,
    this.onReject,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dealers = ref.watch(dealerProvider);

    if (dealers.isEmpty) {
      return const Center(child: Text('No dealers found'));
    }

    final filteredDealers = dealers.where(filter).toList();

    if (filteredDealers.isEmpty) {
      return const Center(child: Text('No dealers in this category'));
    }

    return ListView.builder(
      itemCount: filteredDealers.length,
      itemBuilder: (context, index) {
        final dealer = filteredDealers[index];
        return ListTile(
          title: Text(dealer.businessName),
          subtitle:
              Text('Delivery Areas: ${dealer.deliveryAreaIds.join(", ")}'),
          trailing: _buildActionButtons(dealer),
        );
      },
    );
  }

  Widget _buildActionButtons(Dealer dealer) {
    if (!dealer.isApproved) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.green),
            onPressed: () => onApprove?.call(dealer),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.red),
            onPressed: () => onReject?.call(dealer),
          ),
        ],
      );
    } else {
      return Switch(
        value: dealer.isActive,
        onChanged: (newValue) => onChangeStatus?.call(dealer, newValue),
      );
    }
  }
}
