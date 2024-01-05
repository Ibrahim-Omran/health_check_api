import 'package:flutter/material.dart';
import 'package:health_check/features/auth/presentation/screen/on_boarding_screen.dart';
import 'package:health_check/features/auth/presentation/screen/sign_up_doctor_screen.dart';
import 'package:health_check/features/auth/presentation/screen/sign_up_patient_screen.dart';
import 'package:health_check/features/emergency/presentation/screen/emergency_screen.dart';
import 'package:health_check/features/home/presentation/screen/home_screen.dart';
import 'package:health_check/features/scan/presentation/screen/scan_chest_screen.dart';
import '../../features/auth/presentation/screen/login_screen.dart';
import '../../features/auth/presentation/screen/splash_screen.dart';



class Routes {
  static const String intitlRoute = '/';
  static const String login = '/login';
  static const String signUpPatient = '/signUpPatient';
  static const String signUpDoctor = '/signUpDoctor';
  static const String chest = '/chest';
  static const String onBoarding = '/onBoarding';
  static const String home = '/home';
  static const String emergency = '/emergency';


}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUpPatient:
        return MaterialPageRoute(builder: (_) => const SignUpPatientScreen());
      case Routes.signUpDoctor:
        return MaterialPageRoute(builder: (_) => const SignUpDoctorScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) =>  const Home());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) =>  OnBoardingScreens());
      case Routes.emergency:
        return MaterialPageRoute(builder: (_) => const EmergencyScreen());
      // case Routes.chest:
      //   return MaterialPageRoute(builder: (_) =>   HomeScreen());

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
