import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:health_check/core/utils/app_strings.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_gnav_bar.dart';
import '../cubit/home_cubit/home_cubit.dart';
import '../cubit/home_cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      final cubit = BlocProvider.of<HomeCubit>(context);
      return SafeArea(
        child: Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: CustomGNavWidget(
              currentIndex: cubit.currentIndex,
              onChanged: (value) {
                cubit.changeIndex(value);
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: AppStrings.home,
                  iconColor: AppColors.white,
                ),
                GButton(
                  icon: Icons.person,
                  text: AppStrings.profile,
                  iconColor: AppColors.white,

                ),
              ],
            )),
      );
    });
  }
}
