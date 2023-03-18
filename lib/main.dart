import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_books/features/auth/pages/auth_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Books',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0xff326789),
          onPrimary: Color(0xffe9eef2),
          primaryContainer: Color(0xffC9E6FF),
          onPrimaryContainer: Color(0xff001E2F),
          secondary: Color(0xff326789),
          onSecondary: Color(0xffe9eef2),
          error: Color(0xffe65c4f),
          onError: Color(0xffe9eef2),
          background: Color(0xff78A6C8),
          onBackground: Color(0xffe9eef2),
          surface: Color(0xff78A6C8),
          onSurface: Color(0xff191C1E),
          brightness: Brightness.light,
        ),
      ),
      home: const AuthPage(),
    );
  }
}
