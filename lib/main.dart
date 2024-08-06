import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hft_ai/signup_screen.dart';
import 'package:get/get.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){

  }else {
    await Firebase.initializeApp();
  }
  runApp(const SignupPage());
}

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Signup Page',
      home: SignupScreen(),
    );
  }
}