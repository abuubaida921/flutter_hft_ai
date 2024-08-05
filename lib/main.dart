import 'package:flutter/material.dart';
import 'package:flutter_hft_ai/signup_screen.dart';

void main() {
  runApp(SignupPage());
}

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup Page',
      home: SignupScreen(),
    );
  }
}