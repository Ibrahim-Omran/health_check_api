import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class ScanXRayComponent extends StatelessWidget {
  const ScanXRayComponent({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });

  final String title ;
  final String image ;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          width: double.infinity,
          height: 254.h,
          decoration: BoxDecoration(
            color: AppColors.colorContacts,
            border: Border.all(color: AppColors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 121.w,
                height: 106.h,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.6),
                  //border: Border.all(color: AppColors.black),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    title,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontWeight: FontWeight.bold,color: AppColors.black,),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(width: 10,),

              SizedBox(
                height: 300.h,
                width: 200.w,
                child: Image.asset(
                  image,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
