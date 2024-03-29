import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/utils/app_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/service/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/widget/custom_buttom.dart';
import '../../data/model/on_boarding_model.dart';

class OnBoardingScreens extends StatelessWidget {
  OnBoardingScreens({super.key});

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(28),
          child: PageView.builder(
            controller: controller,
            itemCount: OnBoardingModel.onBoardingScreen.length,
            itemBuilder: (context, index) {
              return Column(
                children: [

                  const Spacer(
                    flex: 1,
                  ),

                  // title
                  Text(
                    OnBoardingModel.onBoardingScreen[index].title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),

                  SizedBox(
                    height: 25.h,
                  ),

                  //subtitle
                  Text(
                    OnBoardingModel.onBoardingScreen[index].subTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  SizedBox(
                    height: 25.h,
                  ),

                  // image
                  SizedBox(
                    width: 300.w,
                    height: 400.h,
                    child: Image.asset(
                      OnBoardingModel.onBoardingScreen[index].imgPath,
                    ),
                  ),

                  SizedBox(
                    height: 25.h,
                  ),

                  // dots
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      dotHeight: 10,
                      spacing: 8,
                    ),
                  ),

                  const Spacer(
                    flex: 2,
                  ),
                  // buttons

                  // Row button on boarding
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      children: [
                        // skip && back
                        index != 2 && index != 1
                            ? CustomButton(
                                background: AppColors.grey.withOpacity(0.02),
                                width: 120.w,
                                onPressed: () {
                                  controller.jumpToPage(2);
                                },
                                fontSize: 16,
                                text: AppStrings.skip,
                              )
                            : CustomButton(
                                background: AppColors.grey.withOpacity(0.02),
                                width: 130.w,
                                onPressed: () {
                                  controller.previousPage(
                                    duration: const Duration(milliseconds: 1000),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                  );
                                },
                                fontSize: 16,
                                text: AppStrings.back,
                              ),

                        const Spacer(),

                        // Next && Get Start
                        index != 2
                            ? CustomButton(
                                width: 120.w,
                                fontSize: 16,
                                onPressed: () {
                                  controller.nextPage(
                                    duration: const Duration(milliseconds: 1000),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                  );
                                },
                                text: AppStrings.next,
                              )
                            : CustomButton(
                                width: 160.w,
                                onPressed: () async {
                                  // Navigate to Login screen
                                  // save data on cache memory
                                  await sl<CacheHelper>()
                                      .saveData(
                                          key: AppStrings.onBoardingKey,
                                          value: true)
                                      .then((value) {
                                     // navigate to login screen
                                    navigate(
                                      context: context,
                                      route: Routes.login,
                                    );

                                  }).catchError((e) {
                                    debugPrint(e.toString());
                                  });
                                },
                                fontSize: 16,
                                text: AppStrings.started,
                              )
                      ],
                    ),
                  ),

                  const Spacer(
                    flex: 1,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
