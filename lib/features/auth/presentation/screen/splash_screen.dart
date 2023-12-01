import 'package:flutter/material.dart';
import 'package:health_check/core/utils/app_assets.dart';

import '../../../../core/routes/app_routes.dart';
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
    Future.delayed(const Duration(seconds: 3)).then((value)  {
      navigate(context: context, route: Routes.login);
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
