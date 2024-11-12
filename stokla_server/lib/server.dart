import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart';

import 'package:stokla_server/src/web/routes/root.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler, // Add this line
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  auth.AuthConfig.set(auth.AuthConfig(
    validationCodeLength: 4,
    sendValidationEmail: (session, email, validationCode) async {
      print('Validation code: $validationCode');
      // Retrieve the credentials

      // Create a SMTP client for Gmail.
      final smtpServer = SmtpServer(
        'in-v3.mailjet.com',
        username: '099cb70e1420a5b297265cac774d6bb9',
        password: '5c4d87fb93f173a29ce156a8d1f5fc65',
        port: 587,
        allowInsecure: true,
      );

      // Create an email message with the validation code.
      final message = Message()
        ..from = Address('viperciyes@gmail.com')
        ..recipients.add(email)
        ..subject = 'Verification code Stokla!'
        ..html = 'Your verification code is: $validationCode';

      // Send the email message.
      try {
        await send(message, smtpServer);
      } catch (_) {
        // Return false if the email could not be sent.
        print('could not send email');
        return false;
      }
      print('email sent');
      return true;
    },
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      print('Validation code: $validationCode');

      return true;
    },
    // onUserCreated: (session, userInfo) async {
    //   if (userInfo.id != null) {
    //     final user = User(
    //       email: userInfo.email!,
    //       name: '',
    //       surname: '',
    //       businessname: '',
    //       businessphone: '',
    //       mobilephone: '',
    //       businessaddress: '',
    //       taxno: '',
    //       taxname: '',
    //       mersisno: '',
    //       passwordHash: '',
    //       role: '',
    //       isApproved: false,
    //       isCompleted: false,
    //       userInfoId: userInfo.id!,
    //     );

    //     try {
    //       //insert a row to users table for each user, will complete the info later.
    //       await User.db.insertRow(session, user);
    //     } catch (e) {
    //       print('Error inserting user: $e'); // Added error handling
    //     }
    //   }
    // },
  ));

  // Start the server.
  await pod.start();
}
