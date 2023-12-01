import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_check/features/auth/presentation/cubit/signup_doctor_cubit/sign_up_doctor_state.dart';

class SignUpDoctorCubit extends Cubit<SignUpDoctorState> {
  SignUpDoctorCubit() : super(SignUpDoctorInitial());

  GlobalKey<FormState> signUpDoctorKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController workingDaysController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isLoginPasswordSowing = true;
  IconData suffixIcon = Icons.visibility;

  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordSowing = !isLoginPasswordSowing;
    suffixIcon =
    isLoginPasswordSowing ? Icons.visibility : Icons.visibility_off;

    emit(ChangeLoginPasswordSuffixIcon());
  }

  // changeConfirmPasswordSuffixIcon..
  bool isConfirmPasswordSowing = true;
  IconData suffixIconConfirmPassword = Icons.visibility;

  void changeConfirmPasswordSuffixIcon() {
    isConfirmPasswordSowing = !isConfirmPasswordSowing;
    suffixIconConfirmPassword =
    isConfirmPasswordSowing ? Icons.visibility : Icons.visibility_off;

    emit(ChangeConfirmPasswordSuffixIcon());
  }




}