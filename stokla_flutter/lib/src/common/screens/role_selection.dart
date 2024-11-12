import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_flutter/src/common/screens/error_page.dart';
import 'package:stokla_flutter/src/common/utils/user_roles.dart';
import 'package:stokla_flutter/src/common/screens/registration.dart';

// Create a provider to store the selected role
final selectedRoleProvider = StateProvider<String?>((ref) => null);

class RoleSelectionScreen extends ConsumerWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Role'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const ErrorPage(
                      error: 'Something went wrong!',
                    )),
          );
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _selectRole(context, ref, 'shop'),
              child: const Text('Shop'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectRole(context, ref, 'dealer'),
              child: const Text('Dealer'),
            ),
          ],
        ),
      ),
    );
  }

  void _selectRole(BuildContext context, WidgetRef ref, String role) {
    // Store the selected role
    ref.read(selectedRoleProvider.notifier).state = role;
    late UserRole ur;
    // Navigate to the appropriate registration screen
    if (role == 'dealer') {
      ur = UserRole.dealer;
    } else if (role == 'shop') {
      ur = UserRole.shop;
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => RegistrationScreen(ur)),
    );
  }
}
