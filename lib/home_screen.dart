import 'package:flutter/material.dart';
import 'package:flutter_hft_ai/sign_up_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SingUpController());
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              controller.logout();
            },
            child: Text('Login Success\nClick to Log out')),
      ),
    );
  }
}
