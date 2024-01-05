import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/utils/commons.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widget/custom_buttom.dart';

class EmergencyComponent extends StatelessWidget {
  const EmergencyComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 177.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 14.h,
          ),
          Text(
            AppStrings.areYouFallingSick,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(
            height: 30.h,
          ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  IconlyLight.calling,
                  size: 45,
                ),

                SizedBox(
                  width: 55.h,
                ),

                Flexible(
                  child: CustomButton(
                    width: 200,
                    height: 60,
                    onPressed: (){
                      // Navigate To emergency Screen
                      navigate(context: context, route: Routes.emergency);
                    },
                    text: AppStrings.emergency,
                    fontSize: 24.spMin,
                    fontWeight: FontWeight.w500,
                    background: AppColors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
