import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hft_ai/app_colors.dart';
import 'package:flutter_svg/svg.dart';

import 'app_routes/app_routes.dart';
import 'authentication_helper.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    if (AuthenticationHelper().user != null) {
      Timer(
          const Duration(seconds: 2),
              () =>Get.offAllNamed(Routes.HOME)
      );
    } else {
      Timer(
          const Duration(seconds: 2),
              () =>Get.offAllNamed(Routes.SIGNIN)
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: SvgPicture.asset(
                'assets/images/brand-icon.svg',
                height: 100,
              ),
            ),
            const SizedBox(height: 10,),
            const CircularProgressIndicator(
              color: AppColors.appBaseColor,
            )
          ],
        ),
      ),
    );
  }
}

