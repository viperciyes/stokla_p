import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_client/stokla_client.dart';
import 'package:stokla_flutter/src/admin/widgets/dealer_list.dart';
import 'package:stokla_flutter/src/common/providers/dealer_provider.dart';
import 'package:stokla_flutter/src/admin/widgets/custom_app_bar.dart';
import 'package:stokla_flutter/src/common/widgets/confirmation_dialog.dart';

class DealerManagementPage extends ConsumerStatefulWidget {
  const DealerManagementPage({super.key});

  @override
  DealerManagementPageState createState() => DealerManagementPageState();
}

class DealerManagementPageState extends ConsumerState<DealerManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    // Fetch dealers when the page is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dealerProvider.notifier).fetchDealers();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//TODO: consider pull to refresh.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Dealer Management'),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Active'),
              Tab(text: 'Inactive'),
              Tab(text: 'Unapproved'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                DealerList(
                  filter: (Dealer dealer) =>
                      dealer.isApproved && dealer.isActive && !dealer.isDeleted,
                  onChangeStatus: _changeDealerStatus,
                ),
                DealerList(
                  filter: (Dealer dealer) =>
                      dealer.isApproved &&
                      !dealer.isActive &&
                      !dealer.isDeleted,
                  onChangeStatus: _changeDealerStatus,
                ),
                DealerList(
                  filter: (Dealer dealer) =>
                      !dealer.isApproved && !dealer.isDeleted,
                  onApprove: _approveDealer,
                  onReject: _rejectDealer,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _approveDealer(Dealer dealer) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: 'Approve Dealer',
        content: 'Are you sure you want to approve ${dealer.businessName}?',
        confirmText: 'Approve',
      ),
    );

    if (confirmed == true) {
      final updatedDealer = dealer.copyWith(isApproved: true, isActive: true);
      debugPrint(updatedDealer.toString());
      await ref.read(dealerProvider.notifier).updateDealer(updatedDealer);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${dealer.businessName} has been approved.')),
        );
      }
    }
  }

  Future<void> _rejectDealer(Dealer dealer) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: 'Reject Dealer',
        content: 'Are you sure you want to reject ${dealer.businessName}?',
        confirmText: 'Reject',
      ),
    );

    if (confirmed == true) {
      final updatedDealer = dealer.copyWith(isDeleted: true);
      await ref.read(dealerProvider.notifier).updateDealer(updatedDealer);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${dealer.businessName} has been rejected.')),
        );
      }
    }
  }

  Future<void> _changeDealerStatus(Dealer dealer, bool newActiveStatus) async {
    // TODO: Implement check for incomplete orders
    // For now, we'll assume there are no incomplete orders

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: 'Change Dealer Status',
        content:
            'Are you sure you want to change ${dealer.businessName}\'s status to ${newActiveStatus ? 'active' : 'inactive'}?',
        confirmText: 'Change Status',
      ),
    );

    if (confirmed == true) {
      final updatedDealer = dealer.copyWith(isActive: newActiveStatus);
      await ref.read(dealerProvider.notifier).updateDealer(updatedDealer);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('${dealer.businessName}\'s status has been updated.')),
        );
      }
    }
  }
}
