import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'custom_text_field.dart';
import 'forgot_pass_controller.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPassController());
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: controller.key,
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.light_mode_rounded)),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width == 990
                        ? MediaQuery.of(context).size.width / 2
                        : 450,
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
                                'Forgot Password',
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
                                        'No worries, we will send you reset instruction.',
                                    style: GoogleFonts.publicSans(
                                        fontSize: 12,
                                        color: AppColors.subHeadingColor),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),

                              Row(
                                children: [
                                  Text(
                                    'Email ',
                                    style: GoogleFonts.publicSans(
                                        color: AppColors.inputBoxTitleColor),
                                  ),
                                  Text(
                                    '*',
                                    style: GoogleFonts.publicSans(
                                        color: Colors.red),
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
                              SizedBox(height: 30),
                              controller.isForgotPassLoading.value
                                  ? Container(
                                      width: MediaQuery.of(context).size.width -
                                          20,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: AppColors.signUpBtnColorBG,
                                          border: Border.all(
                                              color: AppColors
                                                  .signUpBtnColorBorder,
                                              width: 4)),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        controller.resetPassBtnClick();
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                20,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: AppColors.signUpBtnColorBG,
                                            border: Border.all(
                                                color: AppColors
                                                    .signUpBtnColorBorder,
                                                width: 4)),
                                        child: Center(
                                          child: Text(
                                            'Reset Password',
                                            style: GoogleFonts.publicSans(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 30),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width -
                                      20,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                      color: AppColors.white,
                                      border: Border.all(
                                          color: AppColors
                                              .white,
                                          width: 4)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(CupertinoIcons.arrow_left,color: AppColors.appBaseColor,size: 15,),
                                      SizedBox(width: 5,),
                                      Text(
                                        'Back to Login',
                                        style: GoogleFonts.publicSans(
                                          fontSize: 15,
                                          color: AppColors.appBaseColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  MediaQuery.of(context).size.width==990?SizedBox():SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width/2,
                      child: Image.asset('assets/images/authentication-img.jpg',fit: BoxFit.cover,))
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
