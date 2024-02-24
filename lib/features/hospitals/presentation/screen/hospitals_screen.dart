import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/utils/app_assets.dart';
import 'package:health_check/core/widget/back_ground_color_widget.dart';
import 'package:health_check/core/widget/custom_text_form_field.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widget/app_bar_widget.dart';

class HospitalsScreen extends StatelessWidget {
  const HospitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackGroundColorWidget(
          widget: SingleChildScrollView(
            child: Column(
              children: [
                const AppBarWidget(text: AppStrings.hospital),

                // Search bar
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextFormField(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    iconSuffix: Icons.search,
                    filled: true,
                    fillColor: AppColors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        )),
                  ),
                ),

                SizedBox(
                  height: 12.h,
                ),

                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 256.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(30)),
                                child: Image.asset(
                                  AppAssets.hospitalImage,
                                  height: double.infinity,
                                  width: 160.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [

                                    SizedBox(
                                      height: 35.h,
                                    ),
                                    Text('Cairo Hospital',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!.copyWith(fontSize: 24)),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    Text('Location',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!.copyWith(color: AppColors.red,fontWeight: FontWeight.bold)),

                                    SizedBox(
                                      height: 12.h,
                                    ),

                                    Text('Cairo',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge),

                                    SizedBox(
                                      height: 18.h,
                                    ),


                                    Container(
                                        width: 80.w,
                                        height: 47.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.green,
                                            borderRadius:
                                            BorderRadius.circular(7)),
                                        child: const Icon(Icons.call),),

                                  ],
                                ),
                              ),
                              const Spacer(),

                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
