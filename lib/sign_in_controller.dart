import 'package:flutter/material.dart';
import 'package:flutter_hft_ai/app_colors.dart';
import 'package:flutter_hft_ai/app_routes/app_routes.dart';
import 'package:flutter_hft_ai/user_pref.dart';
import 'package:flutter_hft_ai/utils.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication_helper.dart';

class SingInController extends GetxController {
  UserPref userPref = UserPref();
  RxBool isSignInLoading = false.obs;

  RxBool obscurePassword = true.obs;
  RxBool checkBoxVal = false.obs;

  var fbBtnElementColor = AppColors.subHeadingColor.obs;
  var fbBtnBorderColor = AppColors.fbBtnBorder.obs;
  var fbBtnBGColor = AppColors.fbBtnBG.obs;

  var googleBtnElementColor = AppColors.subHeadingColor.obs;
  var googleBtnBorderColor = AppColors.googleBtnBorder.obs;
  var googleBtnBGColor = AppColors.googleBtnBG.obs;

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  final key = GlobalKey<FormState>();
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    SharedPreferences sp = await SharedPreferences.getInstance();
    var myData = sp.getString('sRemember')??'0';
    print(myData);
    if(myData == '1'){
      checkBoxVal.value=true;
      emailEditingController.text=sp.getString('sEmail')!;
      passwordEditingController.text=sp.getString('sPass')!;
    }else{
      checkBoxVal.value=false;
      emailEditingController.text='';
      passwordEditingController.text='';
      userPref.removeEmailPass();
    }
  }

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

  void signInBtnClick() {
    if (key.currentState!.validate()) {
      if(checkBoxVal.value){
        userPref.saveEmailPass(emailEditingController.text.trim(),
            passwordEditingController.text.trim());
      }
      isSignInLoading.value = true;
      AuthenticationHelper()
          .signIn(emailEditingController.text.trim(),
              passwordEditingController.text.trim())
          .then((result) {
        isSignInLoading.value = false;
        if (result == null) {
          Get.toNamed(Routes.HOME);
          Utils.showSuccessMessage('Login Success');
        } else {
          Utils.showFailedMessage(result);
        }
      });
    } else {
      Utils.showFailedMessage('Please check necessary field');
    }
  }

  void logout() {
    AuthenticationHelper().signOut();
    Utils.showSuccessMessage('Logout Success');
    Get.back();
  }
}
