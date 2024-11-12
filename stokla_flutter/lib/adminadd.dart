// File: bin/create_admin.dart

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:stokla_flutter/src/serverpod_client.dart';

void main(List<String> arguments) async {
  // Create a client
  await initializeServerpodClient();

  stdout.write('Enter admin email: ');
  var email = stdin.readLineSync();
  stdout.write('Enter admin password: ');
  var password = stdin.readLineSync();
  stdout.writeln();

  stdout.write('Enter admin name: ');
  var name = stdin.readLineSync();

  stdout.write('Enter admin surname: ');
  var surname = stdin.readLineSync();

  if (email == null || password == null || name == null || surname == null) {
    exit(1);
  }

  try {
    var result =
        await client.admin.createAdminUser(email, password, name, surname);
    debugPrint(result.toString());
  } catch (e) {
    debugPrint(e.toString());
  } finally {
    exit(0);
  }
}
