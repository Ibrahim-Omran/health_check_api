
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_image.dart';

class AppBarColorsComponent extends StatelessWidget {
  const AppBarColorsComponent({super.key, this.visible = true});

  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomImage(
          width: double.infinity,
          fit: BoxFit.cover,
          imgPath: AppAssets.appBarColors,
        ),
        Visibility(
          visible: visible,
          child: Positioned(
            top: 60.h,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.black,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
