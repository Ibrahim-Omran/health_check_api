import 'package:flutter/material.dart';
import 'package:health_check/core/utils/app_assets.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/service/service_locator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    navigateAfterThreeSeconds();
    super.initState();
  }

  // wait some time and navigate to login screen
  void navigateAfterThreeSeconds() {
    bool isVisited =
        sl<CacheHelper>().getData(key: AppStrings.onBoardingKey) ?? false;

    Future.delayed(const Duration(seconds: 2), () {
      navigateReplacement(
        context: context,
        route: isVisited ? Routes.login : Routes.onBoarding,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AppAssets.splashLogo,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
