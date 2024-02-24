import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/utils/app_assets.dart';
import 'package:health_check/core/utils/commons.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../component/category_component.dart';
import '../component/emergency_component.dart';

class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),

            // App Bar
            Text(
              AppStrings.welcome,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
            ),

            SizedBox(
              height: 20.h,
            ),

            // Emergency
            const EmergencyComponent(),

            SizedBox(
              height: 20.h,
            ),

            // Category
            Text(
              AppStrings.category,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
            ),

            SizedBox(
              height: 20.h,
            ),

            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CategoryComponent(
                    url: AppAssets.scanXray,
                    title: AppStrings.scanXray,

                    onTap: (){
                      navigate(context: context, route: Routes.xRay);

                    },
                  ),

                  const SizedBox(width: 10,),

                  CategoryComponent(
                    url: AppAssets.findDoctor,
                    title: AppStrings.findDoctor,
                    onTap: (){
                      navigate(context: context, route: Routes.findDoctor);
                    },
                  ),

                ],
              ),
            ).animate().fade(delay: 50.ms).scale(duration: 700.ms),

            SizedBox(
              height: 10.h,
            ),

            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CategoryComponent(
                    url: AppAssets.hospital,
                    title: AppStrings.hospital,
                    onTap: (){
                     navigate(context: context, route: Routes.hospitalsScreen);

                    },
                  ),

                  const SizedBox(width: 10,),

                  CategoryComponent(
                    url: AppAssets.medicines,
                    title: AppStrings.medicines,
                    onTap: (){
                     // navigate(context: context, route: Routes.findDoctor);
                    },
                  ),

                ],
              ),
            ).animate().fade(delay: 50.ms).scale(duration: 700.ms),

            SizedBox(
              height: 20.h,
            ),





          ],
        ),
      ),
    );
  }
}
