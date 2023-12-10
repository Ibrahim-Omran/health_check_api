
import 'package:get_it/get_it.dart';
import 'package:health_check/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:health_check/features/auth/presentation/cubit/signup_doctor_cubit/sign_up_doctor_cubit.dart';
import 'package:health_check/features/auth/presentation/cubit/signup_patient_cubit/sign_up_patient_cubit.dart';
import 'package:health_check/features/scan/presentation/cubit/chest_cubit/chest_cubit.dart';

import '../database/cache_helper.dart';

final sl = GetIt.instance;

Future<void>  initServiceLocator() async {

  sl.registerLazySingleton<CacheHelper>(()=>CacheHelper());

  //cubits
  sl.registerLazySingleton(()=>LoginCubit());
  sl.registerLazySingleton(()=>SignUpDoctorCubit());
  sl.registerLazySingleton(()=>SignUpPatientCubit());

}