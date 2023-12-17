import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hermanos/screens/authentication/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hermanos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 239, 237, 237),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 239, 237, 237),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
