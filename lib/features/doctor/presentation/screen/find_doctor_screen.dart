import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/utils/app_assets.dart';
import 'package:health_check/core/widget/back_ground_color_widget.dart';
import 'package:health_check/core/widget/custom_text_form_field.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class FindDoctorScreen extends StatelessWidget {
  const FindDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const BackGroundColorWidget(text: AppStrings.findDoctor),

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
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      ),
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
                          color: AppColors.primary.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Name && Image
                              Row(
                                children: [
                                  CircleAvatar(
                                    maxRadius: 35,
                                    child: Image.asset(AppAssets.scanSkullXray),
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Text(
                                  'DR Yousef Emad',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge),
                                ],
                              ),

                              SizedBox(
                                height: 6.h,
                              ),

                              // Line
                              Container(
                                height: 2.h,
                                width: double.infinity,
                                color: AppColors.black,
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              Row(
                                children: [
                                  // Location && Time && Phone
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          Text('Cairo',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.call),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          Text('01016455643',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.access_alarms_sharp),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          Text('8.00pm : 9.00am',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge),
                                        ],
                                      ),
                                    ],
                                  ),

                                  const Spacer(),

                                  // Call button && Price
                                  Column(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 47,
                                        decoration: BoxDecoration(
                                            color: AppColors.grey,
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Center(
                                            child: Text(
                                          '200',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                        )),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                          width: 80,
                                          height: 47,
                                          decoration: BoxDecoration(
                                              color: AppColors.green,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: const Icon(Icons.call)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
