import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.onChanged,
    required this.obscurePassword,
    required this.suffixIcon,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscurePassword;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget suffixIcon;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: obscurePassword,
            obscuringCharacter: '*',
            autofillHints: const <String>[AutofillHints.password],
            cursorColor: Colors.blue,
            keyboardType: keyboardType,
            textInputAction: TextInputAction.next,
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.only(left: 10, bottom: 15, top: 15,),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   borderSide: const BorderSide(
              //     color: Colors.grey,
              //   ),
              // ),
              // disabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   borderSide: const BorderSide(
              //     color: Colors.grey,
              //   ),
              // ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.appBaseColor,
                ),
              ),
              // focusedErrorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   borderSide: const BorderSide(
              //     color: AppColors.focusedColor,
              //   ),
              // ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.lightGrey,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
              errorStyle: const TextStyle(color: Colors.red, fontSize: 11, height: 0.2,),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}