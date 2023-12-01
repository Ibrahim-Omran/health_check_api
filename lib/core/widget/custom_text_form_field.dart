import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.validator,
    this.obscureText = false,
    this.iconSuffix,
    this.suffixIconOnPressed,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final IconData? iconSuffix;
  final VoidCallback? suffixIconOnPressed;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.grey,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        //border: BorderSide(color: AppColors.grey),
        hintText: hintText,
        labelText: labelText,
        //contentPadding: const EdgeInsets.only( bottom: 10),


        //icon: Icon(Icons.face),

        suffixIcon: IconButton(
          onPressed: suffixIconOnPressed,
          icon: Icon(
            iconSuffix,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
