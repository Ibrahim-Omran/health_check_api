import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/features/auth/presentation/component/have_an_account_component.dart';
import 'package:health_check/features/auth/presentation/component/logo_login_signup_component.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widget/custom_buttom.dart';
import '../component/app_bar_colors.dart';
import '../component/text_field_component.dart';
import '../cubit/sign_up_cubit/sign_up_cubit.dart';
import '../cubit/sign_up_cubit/sign_up_state.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AppBarColorsComponent(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: BlocConsumer<SignUpCubit, SignUpState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    final cubit = BlocProvider.of<SignUpCubit>(context);
                    return Form(
                      key: cubit.signUpPatientKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // Logo Login OR SignUp Component
                          const LogoLoginOrSignUpComponent(
                            title: AppStrings.signUp,
                            subTitle: AppStrings.createAnAccountHere,
                          ),

                          SizedBox(
                            height: 35.h,
                          ),

                          // Name
                          TextFieldComponent(
                            controller: cubit.nameController,
                            icon: IconlyLight.profile,
                            hintText: AppStrings.name,
                            validator: (data) {
                              if (data!.isEmpty || data.length < 5) {
                                return AppStrings.pleaseEnterValidName;
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 5.h,
                          ),

                          // Email
                          TextFieldComponent(
                            controller: cubit.emailController,
                            icon: IconlyLight.message,
                            hintText: AppStrings.emailAddress,
                            validator: (data) {
                              if (data!.isEmpty ||
                                  !data.contains('@gmail.com')) {
                                return AppStrings.pleaseEnterValidEmail;
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 5.h,
                          ),

                          // Password
                          TextFieldComponent(
                            controller: cubit.passwordController,
                            icon: IconlyLight.lock,
                            hintText: AppStrings.password,
                            obscureText: cubit.isLoginPasswordSowing,
                            iconSuffix: cubit.suffixIcon,
                            suffixIconOnPressed: () {
                              cubit.changeLoginPasswordSuffixIcon();
                            },
                            validator: (data) {
                              if (data!.length < 8 || data.isEmpty) {
                                return AppStrings.pleaseEnterValidPassword;
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 5.h,
                          ),

                          // Confirm Password
                          TextFieldComponent(
                            controller: cubit.confirmPasswordController,
                            icon: IconlyLight.lock,
                            hintText: AppStrings.confirmPassword,
                            obscureText: cubit.isConfirmPasswordSowing,
                            iconSuffix: cubit.suffixIconConfirmPassword,
                            suffixIconOnPressed: () {
                              cubit.changeConfirmPasswordSuffixIcon();
                            },
                            validator: (data) {
                              if (cubit.passwordController.text !=
                                  cubit.confirmPasswordController.text) {
                                return AppStrings.pleaseEnterValidPassword;
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 10.h,
                          ),

                          // patient or doctor
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 10),
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       // patient
                          //       Row(
                          //         children: [
                          //           Radio(
                          //             activeColor: AppColors.primary,
                          //             value: 'patient',
                          //             groupValue: cubit.typeVal,
                          //             onChanged: (val) {
                          //               cubit.changeTypeAccount(val);
                          //             },
                          //           ),
                          //           const Text(AppStrings.patient),
                          //         ],
                          //       ),
                          //
                          //       const Spacer(),
                          //
                          //       //doctor
                          //       Row(
                          //         children: [
                          //           Radio(
                          //             activeColor: AppColors.primary,
                          //             value: 'doctor',
                          //             groupValue: cubit.typeVal,
                          //             onChanged: (val) {
                          //               cubit.changeTypeAccount(val);
                          //             },
                          //           ),
                          //           const Text(AppStrings.doctor),
                          //         ],
                          //       )
                          //     ],
                          //   ),
                          // ),

                          SizedBox(
                            height: 10.h,
                          ),
                          // SignUp Patient button
                          CustomButton(
                            height: 60.h,
                            onPressed: () {
                              if (cubit.signUpPatientKey.currentState!
                                  .validate()) {}
                            },
                            text: AppStrings.signUp,
                          ),

                          SizedBox(
                            height: 30.h,
                          ),

                          // have an account
                          const HaveAnAccountComponent(),

                          SizedBox(
                            height: 40.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ).animate().fade(delay: 50.ms).scale(duration: 700.ms),
        ),
      ),
    );
  }
}
