import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/features/auth/cubit/auth_cubit.dart';
import 'package:my_books/features/auth/pages/login_or_register.dart';
import 'package:my_books/features/home/pages/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..start(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state.user == null) {
            return const LoginOrRegister();
          } else {
            return const HomePage();
          }
        },
      ),
    );
  }
}
