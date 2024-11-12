import 'package:flutter/material.dart';
import 'package:stokla_flutter/src/common/screens/sign_in.dart';
import 'package:stokla_flutter/src/common/widgets/confirmation_dialog.dart';
import 'package:stokla_flutter/src/serverpod_client.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            // TODO: Implement notifications
          },
        ),
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {
            // TODO: Implement account settings
          },
        ),
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () async {
            var res = await showLogOutDialog(context);
            if (res && context.mounted) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SignInPage()),
                (Route<dynamic> route) => false,
              );
            }
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Future<bool> showLogOutDialog(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => const ConfirmationDialog(
        title: 'Log Out',
        content: 'Are you sure you want to log out?',
        confirmText: 'Log Out!',
      ),
    );
    var res = confirmed ?? false;
    if (res) {
      sessionManager.signOut();
    }
    return res;
  }
}
