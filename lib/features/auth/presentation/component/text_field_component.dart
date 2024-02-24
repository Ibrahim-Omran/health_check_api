import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/bloc/cubit/global_cubit.dart';
import 'package:health_check/core/bloc/cubit/global_state.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    super.key,
    required this.icon,
    this.hintText,
    this.controller,
    this.iconSuffix,
    this.suffixIconOnPressed,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.readOnly = false,

  });

  final IconData icon;
  final String? hintText;
  final IconData? iconSuffix;
  final Function()? suffixIconOnPressed;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 5.h,
        ),
        Column(
          children: [
            BlocBuilder<GlobalCubit,GlobalState>(
            builder: (context,state) {
              final cubit = BlocProvider.of<GlobalCubit>(context);
              return Icon(
                  icon,
                  color: cubit.isDark? AppColors.white : AppColors.black,

                );
              }
            ),
            SizedBox(
              height: 9.h,
            ),
            Container(
              width: 30.w,
              height: 1.h,
              color: AppColors.grey,
            ),
          ],
        ),
        SizedBox(
          width: 5.w,
        ),
        Container(
          width: 1.w,
          height: 25.h,
          color: AppColors.grey,
        ),
        SizedBox(
          width: 10.w,
        ),
        Flexible(
          child: SizedBox(
            width: 280.w,
            height: 66.h,
            child: CustomTextFormField(
              controller: controller,
              hintText: hintText,
              iconSuffix: iconSuffix,
              readOnly: readOnly,
              suffixIconOnPressed: suffixIconOnPressed,
              obscureText: obscureText,
              validator: validator,
              keyboardType: keyboardType,
            ),
          ),
        ),
      ],
    ).animate().fade(delay: 250.ms)
        .slideX(duration: 800.ms);
  }
}
