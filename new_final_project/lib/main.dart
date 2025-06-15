import 'package:flutter/material.dart';
import 'package:new_final_project/sign_up_screen.dart';
import 'login_screen.dart';
import './home_screen.dart';
import 'cart_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login por Voz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const LoginScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/cart': (context) => const CartScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}
