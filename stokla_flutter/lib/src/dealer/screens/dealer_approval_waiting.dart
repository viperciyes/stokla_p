import 'package:flutter/material.dart';

class DealerApprovalWaitingScreen extends StatelessWidget {
  const DealerApprovalWaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Approval Pending')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.hourglass_empty, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'Awaiting Admin Approval',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'Your registration is pending approval. We\'ll notify you once it\'s approved.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
