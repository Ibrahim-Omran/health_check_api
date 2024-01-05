
import 'package:get_it/get_it.dart';
import 'package:health_check/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:health_check/features/auth/presentation/cubit/signup_doctor_cubit/sign_up_doctor_cubit.dart';
import 'package:health_check/features/auth/presentation/cubit/signup_patient_cubit/sign_up_patient_cubit.dart';
import 'package:health_check/features/emergency/presentation/cubit/contacts_cubit.dart';
import 'package:health_check/features/scan/presentation/cubit/chest_cubit/chest_cubit.dart';

import '../../features/home/presentation/cubit/home_cubit/home_cubit.dart';
import '../database/cache/cache_helper.dart';
import '../database/cache/sqflite_helper.dart';

final sl = GetIt.instance;

Future<void>  initServiceLocator() async {

  // helpers
  sl.registerLazySingleton<CacheHelper>(()=>CacheHelper());
  sl.registerLazySingleton<SqfLiteHelper>(()=>SqfLiteHelper());

  // cubits
  sl.registerLazySingleton(()=>LoginCubit());
  sl.registerLazySingleton(()=>SignUpDoctorCubit());
  sl.registerLazySingleton(()=>SignUpPatientCubit());
  sl.registerLazySingleton(()=>HomeCubit());
  sl.registerLazySingleton(()=>ContactsCubit());


}