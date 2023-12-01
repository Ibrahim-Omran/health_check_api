import 'package:flutter/material.dart';
import 'package:health_check/features/auth/presentation/screen/sign_up_doctor_screen.dart';
import 'package:health_check/features/auth/presentation/screen/sign_up_patient_screen.dart';
import '../../features/auth/presentation/screen/login_screen.dart';
import '../../features/auth/presentation/screen/splash_screen.dart';



class Routes {
  static const String intitlRoute = '/';
  static const String login = '/login';
  static const String signUpPatient = '/signUpPatient';
  static const String signUpDoctor = '/signUpDoctor';

  // static const String sendCode = '/sendCode';
  // static const String resetPassword = '/resetPassword';
  // static const String menuHome = '/menuHome';
  // static const String addMeal = '/addMeal';
  // static const String profileHome = '/profileHome';
  // static const String updateProfile = '/updateProfile';
  // static const String setting = '/setting';
  // static const String changePassword = '/changePassword';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUpPatient:
        return MaterialPageRoute(builder: (_) => const SignUpPatientScreen());
      case Routes.signUpDoctor:
        return MaterialPageRoute(builder: (_) => const SignUpDoctorScreen());

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
