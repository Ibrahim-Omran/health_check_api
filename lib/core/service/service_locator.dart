
import 'package:get_it/get_it.dart';
import 'package:health_check/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:health_check/features/auth/presentation/cubit/signup_doctor_cubit/sign_up_doctor_cubit.dart';
import 'package:health_check/features/auth/presentation/cubit/signup_patient_cubit/sign_up_patient_cubit.dart';

final sl = GetIt.instance;

void initServiceLocator(){

  //cubits
  sl.registerLazySingleton(()=>LoginCubit());
  sl.registerLazySingleton(()=>SignUpDoctorCubit());
  sl.registerLazySingleton(()=>SignUpPatientCubit());

}