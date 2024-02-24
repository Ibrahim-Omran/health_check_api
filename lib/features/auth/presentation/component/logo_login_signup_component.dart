import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';

class LogoLoginOrSignUpComponent extends StatelessWidget {
  const LogoLoginOrSignUpComponent({super.key, required this.title, required this.subTitle});

  final String title ;
  final String subTitle ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //logo
        Image.asset(
          AppAssets.appLogo,
          width: 60.w,
          height: 60.h,
        ),

        SizedBox(
          height: 5.h,
        ),

        // title
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 30),
        ),

        SizedBox(
          height: 18.h,
        ),

        // subtitle
        Text(
          subTitle,
          style: Theme.of(context).textTheme.displayMedium,
        ),

      ],
    );
  }
}
