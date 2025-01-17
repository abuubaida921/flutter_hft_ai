import 'package:flutter/material.dart';
import 'package:flutter_hft_ai/app_colors.dart';
import 'package:flutter_hft_ai/home_screen.dart';
import 'package:flutter_hft_ai/utils.dart';
import 'package:get/get.dart';

import 'authentication_helper.dart';

class SingUpController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isGuestLoading = false.obs;
  RxBool isSignUpLoading = false.obs;

  RxBool obscurePassword = true.obs;
  RxBool obscureConfirmPassword = true.obs;
  RxBool checkBoxVal = false.obs;

  var fbBtnElementColor = AppColors.subHeadingColor.obs;
  var fbBtnBorderColor = AppColors.fbBtnBorder.obs;
  var fbBtnBGColor = AppColors.fbBtnBG.obs;

  var googleBtnElementColor = AppColors.subHeadingColor.obs;
  var googleBtnBorderColor = AppColors.googleBtnBorder.obs;
  var googleBtnBGColor = AppColors.googleBtnBG.obs;
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController =
      TextEditingController();
  // SignInProvider signupProvider = SignInProvider();
  final key = GlobalKey<FormState>();

  void continueWithGoogleBtnClick() {
    if (googleBtnElementColor.value == AppColors.subHeadingColor) {
      googleBtnElementColor.value = AppColors.white;
      googleBtnBorderColor.value = AppColors.googleBtnClickedBorder;
      googleBtnBGColor.value = AppColors.googleBtnClickedBG;
    } else {
      googleBtnElementColor.value = AppColors.subHeadingColor;
      googleBtnBorderColor.value = AppColors.googleBtnBorder;
      googleBtnBGColor.value = AppColors.googleBtnBG;
    }
  }

  void continueWithFbBtnClick() {
    if (fbBtnElementColor.value == AppColors.subHeadingColor) {
      fbBtnElementColor.value = AppColors.white;
      fbBtnBorderColor.value = AppColors.fbBtnClickedBorder;
      fbBtnBGColor.value = AppColors.fbBtnClickedBG;
    } else {
      fbBtnElementColor.value = AppColors.subHeadingColor;
      fbBtnBorderColor.value = AppColors.fbBtnBorder;
      fbBtnBGColor.value = AppColors.fbBtnBG;
    }
  }

  void signupBtnClick() {
    if (key.currentState!.validate()) {
      if (checkBoxVal.value) {
        isSignUpLoading.value=true;
        AuthenticationHelper()
            .signUp( emailEditingController.text.trim(), passwordEditingController.text.trim())
            .then((result) {
          isSignUpLoading.value=false;
          if (result == null) {
            Get.to(()=>HomeScreen());
            Utils.showSuccessMessage('Registration Success');
          } else {
            Utils.showFailedMessage(result);
          }
        });
      } else {
        Utils.showFailedMessage('Please accept terms and policy');
      }
    } else {
      Utils.showFailedMessage('Please check necessary field');
    }
    // Get username and password from the user.Pass the data to
// helper method

  }

  void logout() {
    AuthenticationHelper().signOut();
    Utils.showSuccessMessage('Logout Success');
    Get.back();
  }
}
