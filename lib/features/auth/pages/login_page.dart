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
      Navigator.pop(context);
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
          backgroundColor: const Color(0xff326789),
          title: Center(
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(204, 120, 165, 200),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                const Icon(
                  Icons.menu_book_rounded,
                  size: 200,
                  color: Color(0xffe9eef2),
                ),
                const SizedBox(height: 25),

                // welcome message
                const Text(
                  'Welcome back. Login to your account!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff326789),
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
                  onTap: signUserIn,
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
                      child: const Text(
                        'Register now!',
                        style: TextStyle(
                          color: Color(0xff326789),
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
