import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      appBar: AppBar(title: const Text('My Profile')),
      actions: [
        SignedOutAction((context) {
          Navigator.pushReplacementNamed(context, '/');
        })
      ],
      avatarSize: 24,
    );
  }
}
