import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/utils/app_assets.dart';
import 'package:health_check/core/utils/commons.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widget/back_ground_color_widget.dart';
import '../component/scan_x_ray_component.dart';

class ScanXRay extends StatelessWidget {
  const ScanXRay({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const BackGroundColorWidget(text: AppStrings.scanXray),

            ScanXRayComponent(
              title: AppStrings.xRayChest,
              image: AppAssets.chestXray,
              onTap: () {
                navigate(context: context, route: Routes.chest);
              },
            ),

            SizedBox(
              height: 32.h,
            ),

            ScanXRayComponent(
              title: AppStrings.xRaySkull,
              image: AppAssets.skullXray,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
