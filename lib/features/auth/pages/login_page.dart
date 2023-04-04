import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_books/features/auth/pages/widgets/auth_button.dart';
import 'package:my_books/features/auth/pages/widgets/auth_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({required this.onTap, super.key});
  final Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (context.mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (error) {
      Navigator.pop(context);
      showErrorMessage(error.message.toString());
    }
  }

  void showErrorMessage(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.error,
          title: Center(
            child: Text(text,
                style: TextStyle(color: Theme.of(context).colorScheme.onError)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Icon(
                  Icons.menu_book_rounded,
                  size: 200,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(height: 25),

                // welcome message
                Text(
                  'Welcome back. Login to your account!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 25),

                // username textfield
                AuthTextField(
                  controller: emailController,
                  hintText: 'User name',
                  obscureText: false,
                ),
                const SizedBox(height: 5),
                AuthTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),

                // button
                AuthButton(
                  onTap: (signUserIn),
                  text: 'Login',
                ),
                const SizedBox(height: 50),

                // not a member? register now!
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?'),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: widget.onTap,
                      child: Text(
                        'Register now!',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
