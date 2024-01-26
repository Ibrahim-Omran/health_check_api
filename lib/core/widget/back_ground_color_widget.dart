import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class BackGroundColorWidget extends StatelessWidget {
  const BackGroundColorWidget({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 180.h,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary.withOpacity(0.9),
              AppColors.primary.withOpacity(0.6),
              AppColors.primary.withOpacity(0.2),
              AppColors.primary.withOpacity(0.01),
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 6.w, top: 10.h),
        child: IconButton(
          onPressed: () {
            //back
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 30,
          ),
        ),
      ),
    ]);
  }
}
