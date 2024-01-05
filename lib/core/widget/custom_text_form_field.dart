import 'package:flutter/material.dart';
import '../utils/app_colors.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
     this.controller,
    this.hintText,
    this.labelText,
    this.validator,
    this.obscureText = false,
    this.iconSuffix,
    this.suffixIconOnPressed,
    this.keyboardType,
    this.readOnly = false,
    this.enabledBorder, this.focusedBorder, this.hintStyle,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final IconData? iconSuffix;
  final VoidCallback? suffixIconOnPressed;
  final TextInputType? keyboardType;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? hintStyle;

  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.grey,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      readOnly: readOnly,
      decoration: InputDecoration(
        //border: BorderSide(color: AppColors.grey),
        hintText: hintText,
        labelText: labelText,
        hintStyle: hintStyle,
        //contentPadding: const EdgeInsets.only( bottom: 10),


        //icon: Icon(Icons.face),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,

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
