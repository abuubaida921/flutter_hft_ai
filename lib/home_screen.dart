import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: Center(
        child: ElevatedButton(
                onPressed: () {
                  controller.logout();
                },
                child: Text('Welcome to HomePage\nClick to Log out',textAlign: TextAlign.center,)),
      ),
    );
  }
}