LATER 1: silent signin 
// import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Add this import
final storage = FlutterSecureStorage(); // Initialize secure storage


void later ( ) async{ // Check for saved credentials
  final savedUsername = await storage.read(key: 'username');
  final savedPassword = await storage.read(key: 'password');

  if (savedUsername != null && savedPassword != null) {
    // Attempt silent login
    await silentLogin(savedUsername, savedPassword);
  }
}

Future<void> silentLogin(String username, String password) async {
  // Implement your login logic here using saved credentials
  try {
    await sessionManager.login(username, password); // Adjust based on your auth method
  } catch (e) {
    // Handle login failure (e.g., show error, clear credentials)
    await storage.delete(key: 'username');
    await storage.delete(key: 'password');
  }
}

Secure Storage: Use flutter_secure_storage to store and retrieve credentials securely.
Silent Login: Implement the silentLogin function to authenticate the user without prompting for credentials.
Note:
Make sure to handle the case where the saved credentials are invalid or expired, and clear them if necessary.

