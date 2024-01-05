import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../component/category_component.dart';
import '../component/emergency_component.dart';

class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CategoryComponent(
                      url: AppAssets.scanXray,
                      title: AppStrings.scanXray,
                      onTap: (){

                      },
                    ),

                    const SizedBox(width: 10,),

                    CategoryComponent(
                      url: AppAssets.findDoctor,
                      title: AppStrings.findDoctor,
                      onTap: (){

                      },
                    ),

                  ],
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

              // FittedBox(
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       CategoryComponent(
              //         url: AppAssets.scanXrayOne,
              //         title: AppStrings.scanXray,
              //         onTap: (){
              //
              //         },
              //       ),
              //
              //       const SizedBox(width: 10,),
              //
              //       CategoryComponent(
              //         url: AppAssets.scanXrayOne,
              //         title: AppStrings.scanXray,
              //         onTap: (){
              //
              //         },
              //       ),
              //
              //     ],
              //   ),
              // ),





            ],
          ),
        ),
      ),
    );
  }
}
