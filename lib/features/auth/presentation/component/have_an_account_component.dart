import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class HaveAnAccountComponent extends StatelessWidget {
  const HaveAnAccountComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.haveAnAccount,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: 18),
        ),
        SizedBox(
          width: 5.w,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            AppStrings.logIn,
            style:
            Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
