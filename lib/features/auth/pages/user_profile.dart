import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterfire_ui/auth.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      actions: [
        SignedOutAction((context) {
          Navigator.pushReplacementNamed(context, '/');
        })
      ],
      providerConfigs: const [
        EmailProviderConfiguration(),
      ],
      avatarSize: 24,
    );
  }
}
