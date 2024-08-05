import 'package:flutter/material.dart';
import 'package:flutter_hft_ai/app_colors.dart';
import 'package:get/get.dart';

class SingUpController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isGuestLoading = false.obs;

  RxBool obscurePassword = true.obs;
  RxBool checkBoxVal = false.obs;

  var fbBtnElementColor=AppColors.darkGrey.obs;
  var fbBtnBorderColor=AppColors.fbBtnBorder.obs;
  var fbBtnBGColor=AppColors.fbBtnBG.obs;

  var googleBtnElementColor=AppColors.darkGrey.obs;
  var googleBtnBorderColor=AppColors.googleBtnBorder.obs;
  var googleBtnBGColor=AppColors.googleBtnBG.obs;
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  // SignInProvider signupProvider = SignInProvider();
  final key = GlobalKey<FormState>();

  void continueWithGoogleBtnClick() {
    if(googleBtnElementColor.value== AppColors.darkGrey){
      googleBtnElementColor.value = AppColors.white;
      googleBtnBorderColor.value = AppColors.googleBtnClickedBorder;
      googleBtnBGColor.value = AppColors.googleBtnClickedBG;
    }else {
      googleBtnElementColor.value = AppColors.darkGrey;
      googleBtnBorderColor.value = AppColors.googleBtnBorder;
      googleBtnBGColor.value = AppColors.googleBtnBG;
    }
  }
  void continueWithFbBtnClick() {
    if(fbBtnElementColor.value== AppColors.darkGrey){
      fbBtnElementColor.value = AppColors.white;
      fbBtnBorderColor.value = AppColors.fbBtnClickedBorder;
      fbBtnBGColor.value = AppColors.fbBtnClickedBG;
    }else {
      fbBtnElementColor.value = AppColors.darkGrey;
      fbBtnBorderColor.value = AppColors.fbBtnBorder;
      fbBtnBGColor.value = AppColors.fbBtnBG;
    }
  }
}