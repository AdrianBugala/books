import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    required this.onTap,
    super.key,
  });
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: const Text('register page'),
      ),
    );
  }
}
