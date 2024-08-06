import 'package:flutter/material.dart';
import 'package:flutter_hft_ai/signup_screen.dart';

void main() {
  runApp(const SignupPage());
}

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup Page',
      home: SignupScreen(),
    );
  }
}