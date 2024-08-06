import 'package:flutter/material.dart';
import 'package:flutter_hft_ai/app_routes/app_routes.dart';
import 'package:flutter_hft_ai/utils.dart';
import 'package:get/get.dart';

import 'authentication_helper.dart';

class ForgotPassController extends GetxController {
  RxBool isForgotPassLoading = false.obs;

  TextEditingController emailEditingController = TextEditingController();

  final key = GlobalKey<FormState>();

  void resetPassBtnClick() {
    if (key.currentState!.validate()) {
      isForgotPassLoading.value = true;
      AuthenticationHelper()
          .resetPass(emailEditingController.text.trim())
          .then((result) {
        isForgotPassLoading.value = false;
        if (result == null) {
          Get.offAllNamed(Routes.SIGNIN);
          Utils.showSuccessMessage('Please check your registered email.');
        } else {
          Utils.showFailedMessage(result);
        }
      });
    } else {
      Utils.showFailedMessage('Please check necessary field');
    }
  }
}
