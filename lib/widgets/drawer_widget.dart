import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import '../authentication/auth_helper_local.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff27187e),
      child: ListView(
        children: [
          ListTile(
            title: const Text(
              'Sign out',
              style: TextStyle(color: Color(0xfffae588)),
            ),
            tileColor: Colors.pink,
            onTap: () {
              Navigator.pop(context);
              FirebaseUIAuth.signOut();
              AuthHelperLocal.removeUserEmail();
            },
          ),
          ListTile(
            title: const Text(
              'User Profile',
              style: TextStyle(color: Color(0xfffae588)),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(
              'Date Preferences',
              style: TextStyle(color: Color(0xfffae588)),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
