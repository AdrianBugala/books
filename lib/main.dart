import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_books/app/injection_container.dart';
import 'package:my_books/features/auth/pages/auth_page.dart';
import 'firebase_options.dart';

void main() async {
  configureDependencies();
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
          primaryContainer: Color.fromARGB(255, 190, 215, 234),
          onPrimaryContainer: Color.fromARGB(255, 255, 255, 255),
          secondaryContainer: Color.fromARGB(255, 190, 215, 234),
          onSecondaryContainer: Color.fromARGB(255, 13, 87, 139),
          secondary: Color(0xff326789),
          onSecondary: Color(0xffe9eef2),
          error: Color(0xffe65c4f),
          onError: Color.fromARGB(255, 255, 255, 255),
          background: Color(0xff78A6C8),
          onBackground: Color(0xffe9eef2),
          surface: Color(0xff78A6C8),
          onSurface: Color(0xff191C1E),
          shadow: Color.fromARGB(255, 59, 97, 122),
          brightness: Brightness.light,
        ),
      ),
      home: const AuthPage(),
    );
  }
}
