import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_check/features/auth/presentation/cubit/signup_doctor_cubit/sign_up_doctor_cubit.dart';
import 'package:health_check/features/auth/presentation/cubit/signup_patient_cubit/sign_up_patient_cubit.dart';
import 'app/app.dart';
import 'core/service/service_locator.dart';
import 'features/auth/presentation/cubit/login_cubit/login_cubit.dart';

void main() {
  initServiceLocator();
  runApp(
    MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) => sl<LoginCubit>(),
        ),

        BlocProvider(
          create: (context) => sl<SignUpDoctorCubit>(),
        ),

        BlocProvider(
          create: (context) => sl<SignUpPatientCubit>(),
        ),

      ],
      child: const MyApp(),
    ),
  );
}
