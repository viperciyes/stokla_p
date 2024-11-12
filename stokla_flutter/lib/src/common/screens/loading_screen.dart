import 'package:flutter/material.dart';
import 'package:stokla_flutter/src/admin/widgets/custom_app_bar.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Loading...'),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
