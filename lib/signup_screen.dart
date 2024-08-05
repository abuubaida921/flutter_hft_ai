import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hft_ai/sign_up_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'app_colors.dart';
import 'custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SingUpController());
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
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
                        'Create Account',
                        style: TextStyle(
                          color: AppColors.darkGrey,
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
                                'Sign up now and get free account instant. Already ',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                            children: <TextSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Header Sign in Clicked');
                                  },
                                text: 'Sign in',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
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
                          Text('Email '),
                          Text(
                            '*',
                            style: TextStyle(color: Colors.red),
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
                          } else if (1 == 1) {
                            return null;
                          } else {
                            return 'Please enter email.';
                          }
                        },
                      ),
                      SizedBox(height: 20),

                      Row(
                        children: [
                          Text('Password '),
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
                          } else if (value.isNotEmpty) {
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
                          Text('Confirm Password'),
                        ],
                      ),

                      SizedBox(height: 10),

                      ///Confirm Password input field
                      CustomTextFieldWidget(
                        controller: controller.confirmPasswordEditingController,
                        hintText: 'Confirm Password',
                        obscurePassword: controller.obscureConfirmPassword.value,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field is mandatory!";
                          } else if (value.isNotEmpty) {
                            return null;
                          } else {
                            return 'Please enter password.';
                          }
                        },
                        suffixIcon: InkWell(
                          onTap: (){
                            controller.obscureConfirmPassword.value=!controller.obscureConfirmPassword.value;
                          },
                          child: Icon(
                            controller.obscureConfirmPassword.value?Icons.visibility_off:Icons.visibility,
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
                              }),
                          Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              text: 'Terms of Use',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.appBaseColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' & ',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              print('ccc');
                                            },
                                          text: 'Privacy Policy',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.appBaseColor,
                                          ))
                                    ]
                                    // Add a click event if needed
                                    ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width - 20,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: AppColors.appBaseColor,
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      Row(
                        children: [
                          Text('Sign up with your social network.',style: TextStyle(color: AppColors.lightGrey),),
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
                                'assets/images/brand-icon.svg',
                                height: 40,
                                width: 40,
                                color: controller.googleBtnElementColor.value,
                              ),
                              Text(
                                'Continue with Google',
                                style: TextStyle(
                                  fontSize: 18,
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
                                'assets/images/brand-icon.svg',
                                height: 40,
                                width: 40,
                                color: controller.fbBtnElementColor.value,
                              ),
                              Text(
                                'Continue with Facebook',
                                style: TextStyle(
                                  fontSize: 18,
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
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                            children: [
                              TextSpan(
                                  text: 'Block Bootstrap 5 Theme',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.appBaseColor,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: ' | Designed by ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.lightGrey,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'CodesCandy',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.appBaseColor,
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
        ));
  }
}
