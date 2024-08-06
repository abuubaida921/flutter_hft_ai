import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hft_ai/app_routes/app_routes.dart';
import 'package:flutter_hft_ai/sign_in_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SingInController());
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: controller.key,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/brand-icon.svg',
                        height: 100,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome Back',
                          style: GoogleFonts.publicSans(
                            color: AppColors.headingColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),

                        Center(
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              text:
                                  'Don’t have an account yet? ',
                              style: GoogleFonts.publicSans(
                                  fontSize: 12, color: AppColors.subHeadingColor),
                              children: <TextSpan>[
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Header Sign in Clicked');
                                      Get.toNamed(Routes.SIGNUP);
                                    },
                                  text: 'Register here',
                                  style: GoogleFonts.publicSans(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.appBaseColor,
                                  ),
                                  // Add a click event if needed
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        Row(
                          children: [
                            Text('Email ',style: GoogleFonts.publicSans(color: AppColors.inputBoxTitleColor),),
                            Text(
                              '*',
                              style: GoogleFonts.publicSans(color: Colors.red),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        ///Email input field
                        CustomTextFieldWidget(
                          controller: controller.emailEditingController,
                          hintText: 'Email',
                          obscurePassword: false,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field is mandatory!";
                            } else if (value.isValidEmail()) {
                              return null;
                            } else {
                              return 'Please enter email.';
                            }
                          },
                        ),
                        SizedBox(height: 20),

                        Row(
                          children: [
                            Text('Password ',style: GoogleFonts.publicSans(color: AppColors.inputBoxTitleColor),),
                          ],
                        ),
                        SizedBox(height: 10),

                        ///Password input field
                        CustomTextFieldWidget(
                          controller: controller.passwordEditingController,
                          hintText: 'Password',
                          obscurePassword: controller.obscurePassword.value,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field is mandatory!";
                            } else if (value.length<8) {
                              return 'Password must be of length 8.';
                            } else if (value.length>=8) {
                              return null;
                            } else {
                              return 'Please enter password.';
                            }
                          },
                          suffixIcon: InkWell(
                            onTap: (){
                              controller.obscurePassword.value=!controller.obscurePassword.value;
                            },
                            child: Icon(
                              controller.obscurePassword.value?Icons.visibility_off:Icons.visibility,
                              color: AppColors.lightGrey,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Checkbox(
                                value: controller.checkBoxVal.value,
                                onChanged: (newVal) {
                                  controller.checkBoxVal.value = newVal!;
                                },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(width: 1.0, color: AppColors.inputBoxBorderColor),
                              ),
                                ),
                            Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('ccc');
                                  },
                                text: 'Remember me',
                                style:  GoogleFonts.publicSans(
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.subHeadingColor,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('ccc');
                                  },
                                text: 'Forgot Password',
                                style:  GoogleFonts.publicSans(
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.linkColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        controller.isSignInLoading.value?
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.signUpBtnColorBG,
                            border: Border.all(color: AppColors.signUpBtnColorBorder,width:4)
                          ),
                          child: Center(
                            child: CircularProgressIndicator(color: Colors.white,),
                          ),
                        ):
                        InkWell(
                          onTap: (){
                            controller.signInBtnClick();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 20,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: AppColors.signUpBtnColorBG,
                              border: Border.all(color: AppColors.signUpBtnColorBorder,width:4)
                            ),
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: GoogleFonts.publicSans(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),

                        Row(
                          children: [
                            Text('Sign in with your social network.',style: GoogleFonts.publicSans(color: AppColors.subHeadingColor),),
                          ],
                        ),

                        SizedBox(height: 10),
                        InkWell(
                          onTap: (){
                            controller.continueWithGoogleBtnClick();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 20,
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(color: controller.googleBtnBorderColor.value),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: controller.googleBtnBGColor.value,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/icon-google_1.svg',
                                  height: 20,
                                  width: 20,
                                  color: controller.googleBtnElementColor.value,
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  'Continue with Google',
                                  style: GoogleFonts.publicSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: controller.googleBtnElementColor.value,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 10),
                        InkWell(
                          onTap: (){
                            controller.continueWithFbBtnClick();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 20,
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(color: controller.fbBtnBorderColor.value),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: controller.fbBtnBGColor.value,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/icon-facebook.svg',
                                  height: 20,
                                  width: 20,
                                  color: controller.fbBtnElementColor.value,
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  'Continue with Facebook',
                                  style: GoogleFonts.publicSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: controller.fbBtnElementColor.value,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        Center(
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              text:
                                  'Copyright © ',
                              style:  GoogleFonts.publicSans(
                                  fontSize: 12, color: AppColors.subHeadingColor),
                              children: [
                                TextSpan(
                                    text: 'Block Bootstrap 5 Theme',
                                    style:  GoogleFonts.publicSans(
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.linkColor,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: ' | Designed by ',
                                          style:  GoogleFonts.publicSans(
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.subHeadingColor,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'CodesCandy',
                                              style:  GoogleFonts.publicSans(
                                                fontWeight: FontWeight.normal,
                                                color: AppColors.linkColor,
                                              ),
                                              // Add a click event if needed
                                            ),
                                          ]),
                                    ]),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}