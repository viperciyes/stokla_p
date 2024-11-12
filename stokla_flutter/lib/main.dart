import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_flutter/src/common/screens/auth_wrapper.dart';
import 'package:stokla_flutter/src/common/screens/onboarding_page.dart';
import 'package:stokla_flutter/src/serverpod_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeServerpodClient();

  final prefs = await SharedPreferences.getInstance();
  final isFirstTime = prefs.getBool('isFirstTime') ?? true;

  if (isFirstTime) {
    await prefs.setBool('isFirstTime', false);
  }

  runApp(ProviderScope(child: MyApp(isFirstTime: isFirstTime)));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beverage Distribution App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isFirstTime ? const OnboardingPage() : const AuthWrapper(),
    );
  }
}
