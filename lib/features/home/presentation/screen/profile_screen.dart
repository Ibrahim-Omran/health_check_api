import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/bloc/cubit/global_cubit.dart';
import 'package:health_check/core/bloc/cubit/global_state.dart';
import 'package:health_check/core/utils/app_assets.dart';
import 'package:health_check/core/utils/app_colors.dart';
import 'package:health_check/core/widget/back_ground_color_widget.dart';
import 'package:health_check/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:health_check/features/home/presentation/cubit/home_cubit/home_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGroundColorWidget(
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<GlobalCubit, GlobalState>(builder: (context, state) {
          final cubit = BlocProvider.of<GlobalCubit>(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: SizedBox(
                  width: 120.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.asset(AppAssets.profile),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  'Ibrahim Omran',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Setting',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SwitchListTile(
                thumbIcon: MaterialStateProperty.all(cubit.isDark
                    ? const Icon(Icons.mode_night)
                    : const Icon(Icons.sunny)),
                secondary: const Icon(
                  Icons.sunny,
                  color: AppColors.primary,
                ),
                title: Text(
                  cubit.isDark ? "Dark Mode" : "Lite Mode",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                value: cubit.isDark ? true : false,
                onChanged: (value) {
                  cubit.changeTheme();
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
