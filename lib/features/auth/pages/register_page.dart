import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_books/features/auth/pages/widgets/auth_button.dart';
import 'package:my_books/features/auth/pages/widgets/auth_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    required this.onTap,
    super.key,
  });
  final Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        Navigator.pop(context);
        showErrorMessage('Password don\' match');
        return;
      }
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
                  'Let\'s create an account for you!',
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
                const SizedBox(height: 5),
                AuthTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),

                // button
                AuthButton(
                  onTap: signUserUp,
                  text: 'Sign Up',
                ),
                const SizedBox(height: 50),

                // not a member? register now!
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: widget.onTap,
                      child: Text(
                        'Login now!',
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
