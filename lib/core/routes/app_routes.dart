import 'package:flutter/material.dart';
import 'package:health_check/features/auth/presentation/screen/on_boarding_screen.dart';
import 'package:health_check/features/auth/presentation/screen/sign_up_doctor_screen.dart';
import 'package:health_check/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:health_check/features/emergency/presentation/screen/emergency_screen.dart';
import 'package:health_check/features/home/presentation/screen/home_screen.dart';
import 'package:health_check/features/hospitals/presentation/screen/hospitals_screen.dart';
import 'package:health_check/features/scan/presentation/screen/scan_chest_screen.dart';
import 'package:health_check/features/scan/presentation/screen/scan_x_ray.dart';
import '../../features/auth/presentation/screen/login_screen.dart';
import '../../features/auth/presentation/screen/splash_screen.dart';
import '../../features/doctor/presentation/screen/find_doctor_screen.dart';
import '../../features/scan/presentation/screen/scan_skull_screen.dart';



class Routes {
  static const String intitlRoute = '/';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String signUpDoctor = '/signUpDoctor';
  static const String onBoarding = '/onBoarding';
  static const String home = '/home';
  static const String emergency = '/emergency';
  static const String chest = '/chest';
  static const String xRay = '/xray';
  static const String xSkull = '/xSkull';
  static const String findDoctor = '/findDoctor';
  static const String hospitalsScreen = '/hospitalsScreen';



}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.signUpDoctor:
        return MaterialPageRoute(builder: (_) => const SignUpDoctorScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) =>  OnBoardingScreens());
      case Routes.emergency:
        return MaterialPageRoute(builder: (_) => const EmergencyScreen());
      case Routes.chest:
        return MaterialPageRoute(builder: (_) => const ScanXrayChest());
      case Routes.xRay:
        return MaterialPageRoute(builder: (_) => const ScanXRay());
      case Routes.xSkull:
        return MaterialPageRoute(builder: (_) => const ScanSkullXray());
      case Routes.findDoctor:
        return MaterialPageRoute(builder: (_) => const FindDoctorScreen());
      case Routes.hospitalsScreen:
        return MaterialPageRoute(builder: (_) => const HospitalsScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Not Found..!'),
            ),
          ),
        );
    }
  }
}
