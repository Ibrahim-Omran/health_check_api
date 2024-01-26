// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:health_check/features/auth/presentation/component/have_an_account_component.dart';
// import 'package:health_check/features/auth/presentation/component/logo_login_signup_component.dart';
// import 'package:health_check/features/auth/presentation/cubit/signup_doctor_cubit/sign_up_doctor_cubit.dart';
// import 'package:health_check/features/auth/presentation/cubit/signup_doctor_cubit/sign_up_doctor_state.dart';
// import 'package:iconly/iconly.dart';
//
// import '../../../../core/utils/app_strings.dart';
// import '../../../../core/widget/custom_buttom.dart';
// import '../component/app_bar_colors.dart';
// import '../component/selected_time_component.dart';
// import '../component/text_field_component.dart';
//
// class SignUpDoctorScreen extends StatelessWidget {
//   const SignUpDoctorScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               const AppBarColorsComponent(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 35),
//                 child: BlocConsumer<SignUpDoctorCubit, SignUpDoctorState>(
//                   listener: (context, state) {},
//                   builder: (context, state) {
//                     final cubit = BlocProvider.of<SignUpDoctorCubit>(context);
//                     return Form(
//                       key: cubit.signUpDoctorKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           // Logo Login OR SignUp Component
//                           const LogoLoginOrSignUpComponent(
//                             title: AppStrings.signUp,
//                             subTitle: AppStrings.createAnAccountHere,
//                           ),
//
//                           SizedBox(
//                             height: 35.h,
//                           ),
//
//                           // Name
//                           TextFieldComponent(
//                             controller: cubit.nameController,
//                             icon: IconlyLight.profile,
//                             hintText: AppStrings.name,
//                             validator: (data) {
//                               if (data!.isEmpty || data.length < 5) {
//                                 return AppStrings.pleaseEnterValidName;
//                               }
//                               return null;
//                             },
//                           ),
//
//                           SizedBox(
//                             height: 5.h,
//                           ),
//
//                           // Phone Number
//                           TextFieldComponent(
//                             controller: cubit.phoneController,
//                             icon: Icons.phone_android_outlined,
//                             hintText: AppStrings.phoneNumber,
//                             keyboardType: TextInputType.phone,
//                             validator: (data) {
//                               if (data!.isEmpty || data.length > 11) {
//                                 return AppStrings.pleaseEnterValidName;
//                               }
//                               return null;
//                             },
//                           ),
//
//                           SizedBox(
//                             height: 5.h,
//                           ),
//
//                           // Email
//                           TextFieldComponent(
//                             controller: cubit.emailController,
//                             icon: IconlyLight.message,
//                             hintText: AppStrings.emailAddress,
//                             validator: (data) {
//                               if (data!.isEmpty ||
//                                   !data.contains('@gmail.com')) {
//                                 return AppStrings.pleaseEnterValidEmail;
//                               }
//                               return null;
//                             },
//                           ),
//
//                           SizedBox(
//                             height: 5.h,
//                           ),
//
//                           // Password
//                           TextFieldComponent(
//                             controller: cubit.passwordController,
//                             icon: IconlyLight.lock,
//                             hintText: AppStrings.password,
//                             obscureText: cubit.isLoginPasswordSowing,
//                             iconSuffix: cubit.suffixIcon,
//                             suffixIconOnPressed: () {
//                               cubit.changeLoginPasswordSuffixIcon();
//                             },
//                             validator: (data) {
//                               if (data!.length < 8 || data.isEmpty) {
//                                 return AppStrings.pleaseEnterValidPassword;
//                               }
//                               return null;
//                             },
//                           ),
//
//                           SizedBox(
//                             height: 5.h,
//                           ),
//
//                           // Confirm Password
//                           TextFieldComponent(
//                             controller: cubit.confirmPasswordController,
//                             icon: IconlyLight.lock,
//                             hintText: AppStrings.confirmPassword,
//                             obscureText: cubit.isConfirmPasswordSowing,
//                             iconSuffix: cubit.suffixIconConfirmPassword,
//                             suffixIconOnPressed: () {
//                               cubit.changeConfirmPasswordSuffixIcon();
//                             },
//                             validator: (data) {
//                               if (cubit.passwordController.text !=
//                                   cubit.confirmPasswordController.text) {
//                                 return AppStrings.pleaseEnterValidPassword;
//                               }
//                               return null;
//                             },
//                           ),
//
//                           SizedBox(
//                             height: 5.h,
//                           ),
//
//                           // Specialization
//                           TextFieldComponent(
//                             controller: cubit.specializationController,
//                             icon: Icons.medical_services_outlined,
//                             hintText: AppStrings.specialization,
//                             validator: (data) {
//                               if (data!.isEmpty) {
//                                 return AppStrings
//                                     .pleaseEnterValidSpecialization;
//                               }
//                               return null;
//                             },
//                           ),
//
//                           SizedBox(
//                             height: 5.h,
//                           ),
//
//                           // Your location
//                           TextFieldComponent(
//                             controller: cubit.locationController,
//                             icon: IconlyLight.location,
//                             hintText: AppStrings.location,
//                             validator: (data) {
//                               if (data!.isEmpty) {
//                                 return AppStrings.pleaseEnterValidLocation;
//                               }
//                               return null;
//                             },
//                           ),
//
//                           SizedBox(
//                             height: 5.h,
//                           ),
//
//                           // Price
//                           TextFieldComponent(
//                             controller: cubit.priceController,
//                             icon: Icons.price_change_outlined,
//                             hintText: AppStrings.price,
//                             keyboardType: TextInputType.number,
//                             validator: (data) {
//                               if (data!.isEmpty) {
//                                 return AppStrings.pleaseEnterValidPrice;
//                               }
//                               return null;
//                             },
//                           ),
//
//                           SizedBox(
//                             height: 5.h,
//                           ),
//
//                           // working days
//                           TextFieldComponent(
//                             controller: cubit.workingDaysController,
//                             icon: IconlyLight.work,
//                             hintText: AppStrings.workingDays,
//                             validator: (data) {
//                               if (data!.isEmpty) {
//                                 return AppStrings.pleaseEnterValidWorkingDays;
//                               }
//                               return null;
//                             },
//                           ),
//
//                           SizedBox(
//                             height: 5.h,
//                           ),
//
//                           // start & end time
//                           SelectedTimeComponent(cubit: cubit),
//
//                           SizedBox(
//                             height: 25.h,
//                           ),
//
//                           // SignUp Doctor button
//                           CustomButton(
//                             height: 60.h,
//                             onPressed: () {
//                               if (cubit.signUpDoctorKey.currentState!
//                                   .validate()) {}
//                             },
//                             text: AppStrings.signUp,
//                           ),
//
//                           SizedBox(
//                             height: 30.h,
//                           ),
//
//                           // have an account
//                           const HaveAnAccountComponent(),
//
//                           SizedBox(
//                             height: 40.h,
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ).animate().fade(delay: 50.ms).scale(duration: 700.ms),
//         ),
//       ),
//     );
//   }
// }
//
