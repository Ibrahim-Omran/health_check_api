import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/utils/app_colors.dart';
import 'package:health_check/core/utils/app_strings.dart';
import 'package:health_check/core/utils/commons.dart';
import 'package:health_check/core/widget/custom_buttom.dart';
import 'package:health_check/features/auth/presentation/component/doctor_or_patient_component.dart';
import 'package:health_check/features/auth/presentation/component/text_field_component.dart';
import 'package:health_check/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:health_check/features/auth/presentation/cubit/login_cubit/login_state.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/routes/app_routes.dart';
import '../component/app_bar_colors.dart';
import '../component/logo_login_signup_component.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AppBarColorsComponent(visible: false,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: BlocConsumer<LoginCubit,LoginState>(
                  listener: (context, state) {

                  },
                  builder: (context, state) {
                    final cubit = BlocProvider.of<LoginCubit>(context);
                    return Form(
                      key: cubit.loginKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const LogoLoginOrSignUpComponent(
                            title: AppStrings.logIn,
                            subTitle: AppStrings.welcomeBack,
                          ),

                          SizedBox(
                            height: 50.h,
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
                            height: 2.h,
                          ),

                          // Password
                          TextFieldComponent(
                            controller: cubit.passwordController,
                            icon: IconlyLight.lock,
                            hintText: AppStrings.password,
                            obscureText: cubit.isLoginPasswordSowing,
                            iconSuffix: cubit.suffixIcon,
                            suffixIconOnPressed: (){
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
                            height: 46.h,
                          ),

                          // login button
                          CustomButton(
                            height: 60.h,
                            onPressed: () {

                              navigate(context: context, route: Routes.home);

                              // if (cubit.loginKey.currentState!
                              //     .validate()) {
                              //   navigate(context: context, route: Routes.home);
                              // }


                            },
                            text: AppStrings.logIn,
                          ),

                          SizedBox(
                            height: 30.h,
                          ),


                          // new member
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.newMember,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontSize: 18),
                              ),

                              SizedBox(
                                width: 5.w,
                              ),
                              InkWell(
                                onTap: (){
                                  // navigate to sign up doctor..
                                  navigate(context: context, route: Routes.signUp);
                                },
                                child: Text(
                                  AppStrings.signUp,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(color: AppColors.primary),
                                ),
                              ),
                            ],
                          ),


                          // doctor OR patient
                           //const DoctorOrPatientComponent(),

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

// animated
// =>  .animate().fade(delay: 250.ms).slideX(duration: 3.seconds),
// =>  .animate().fade(delay: 250.ms).slideX(duration: 3.seconds),
