import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/routes/app_routes.dart';
import 'package:health_check/core/utils/commons.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class DoctorOrPatientComponent extends StatelessWidget {
  const DoctorOrPatientComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // new member
        Center(
          child: Text(
            AppStrings.newMember,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 18),
          ),
        ),

        SizedBox(
          height: 30.h,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CustomButton(
            //   height: 65.h,
            //   width: 125.w,
            //   fontSize: 14,
            //   background: AppColors.primary,
            //   onPressed: () {
            //     // navigate to sign up doctor..
            //     navigate(context: context, route: Routes.signUp);
            //   },
            //   text: AppStrings.doctor,
            // ),

            InkWell(
              onTap: () {
                // navigate to sign up doctor..
               // navigate(context: context, route: Routes.signUpDoctor);
              },
              child: Text(
                AppStrings.doctor,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: AppColors.primary),
              ),
            ),
            // add some space
            SizedBox(
              width: 15.w,
            ),

            //logo
            Image.asset(
              AppAssets.or,
              width: 60.w,
              height: 60.h,
            ),

            // add some space
            SizedBox(
              width: 15.w,
            ),

            // CustomButton(
            //   height: 65.h,
            //   width: 120.w,
            //   fontSize: 14,
            //   background: AppColors.primary,
            //   onPressed: () {
            //     // navigate to sign up patient..
            //   },
            //   text: AppStrings.patient,
            // ),

            InkWell(
              onTap: () {
                // navigate to sign up patient..
               // navigate(context: context, route: Routes.signUp);
              },
              child: Text(
                AppStrings.patient,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ).animate().fade().rotate(duration: 3.seconds),
      ],
    );
  }
}
