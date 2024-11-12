import 'package:flutter/material.dart';
import 'package:stokla_flutter/src/common/screens/auth_wrapper.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Beverage Distribution App!',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Connect shops and dealers seamlessly.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            // Add more onboarding content here if needed
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the AuthWrapper
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const AuthWrapper()),
            );
          },
          child: const Text('Get Started'),
        ),
      ),
    );
  }
}
