import 'package:flutter/material.dart';

import 'package:stokla_flutter/src/admin/widgets/custom_app_bar.dart';

class ErrorPage extends StatelessWidget {
  final String error;
  const ErrorPage({super.key, this.error = "Something went wrong!"});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Error Page'),
      // backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hmm...',
              style: TextStyle(color: Colors.lightBlue, fontSize: 28),
            ),
            const SizedBox(height: 20),
            Text(
              error,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Container(
              width: size.width * 0.85,
              height: size.width * 0.85,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Image.asset(
                'assets/images/error.jpeg',
                width: size.width * 0.8,
                height: size.width * 0.8,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add retry logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(0, 157, 255, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text(
                'Let\'s try again',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
