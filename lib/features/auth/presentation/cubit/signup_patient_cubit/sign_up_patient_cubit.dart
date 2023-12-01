import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_check/features/auth/presentation/cubit/signup_patient_cubit/sign_up_patient_state.dart';

class SignUpPatientCubit extends Cubit<SignUpPatientState> {
  SignUpPatientCubit() : super(SignUpPatientInitial());

  GlobalKey<FormState> signUpPatientKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
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


