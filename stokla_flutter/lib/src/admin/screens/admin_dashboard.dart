import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_flutter/src/admin/screens/dealer_management.dart';
import 'package:stokla_flutter/src/admin/widgets/custom_app_bar.dart';
import 'package:stokla_flutter/src/admin/widgets/dashboard_card.dart';

class AdminDashboard extends ConsumerWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardStats = ref.watch(adminDashboardStatsProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Admin Dashboard'),
      body: dashboardStats.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (stats) => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Overview',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              _buildStatisticsGrid(context, stats),
              const SizedBox(height: 32),
              Text('Quick Actions',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              _buildQuickActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatisticsGrid(BuildContext context, AdminDashboardStats stats) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        DashboardCard(
          title: 'Total Dealers',
          value: stats.totalDealers.toString(),
          icon: Icons.store,
        ),
        DashboardCard(
          title: 'Pending',
          value: stats.pendingApprovals.toString(),
          icon: Icons.pending_actions,
        ),
        DashboardCard(
          title: 'Active Orders',
          value: stats.activeOrders.toString(),
          icon: Icons.shopping_cart,
        ),
        DashboardCard(
          title: 'Total Revenue',
          value: '\$${stats.totalRevenue.toStringAsFixed(2)}',
          icon: Icons.attach_money,
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.start,
      spacing: 16,
      runSpacing: 16,
      children: [
        // ElevatedButton.icon(
        //   onPressed: () =>
        //       _navigateToPage(context, const AdminManagementPage()),
        //   icon: const Icon(Icons.admin_panel_settings),
        //   label: const Text('Manage Admins'),
        // ),
        ElevatedButton.icon(
          onPressed: () =>
              _navigateToPage(context, const DealerManagementPage()),
          icon: const Icon(Icons.store),
          label: const Text('Manage Dealers'),
        ),
        // ElevatedButton.icon(
        //   onPressed: () => _navigateToPage(context, const StatisticsPage()),
        //   icon: const Icon(Icons.bar_chart),
        //   label: const Text('View Statistics'),
        // ),
      ],
    );
  }

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

// AdminDashboardStats model
class AdminDashboardStats {
  final int totalDealers;
  final int pendingApprovals;
  final int activeOrders;
  final double totalRevenue;

  AdminDashboardStats({
    required this.totalDealers,
    required this.pendingApprovals,
    required this.activeOrders,
    required this.totalRevenue,
  });
}

final adminDashboardStatsProvider =
    FutureProvider<AdminDashboardStats>((ref) async {
  // TODO: Implement API call to fetch dashboard stats
  // For now, return dummy data
  await Future.delayed(const Duration(seconds: 1)); // Simulating API delay
  return AdminDashboardStats(
    totalDealers: 50,
    pendingApprovals: 5,
    activeOrders: 100,
    totalRevenue: 25000.00,
  );
});
