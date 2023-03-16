
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.controller,
    required this.hintText,
    required this.obscureText,
    super.key,
  });
  final controller;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          color: Color(0xff326789),
          // fontWeight: FontWeight.bold,
        ),
        cursorColor: const Color(0xff326789),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 167, 201, 227)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff326789)),
          ),
          fillColor: const Color.fromARGB(255, 190, 215, 234),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            // fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
