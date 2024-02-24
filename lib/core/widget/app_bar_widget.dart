import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/bloc/cubit/global_cubit.dart';
import 'package:health_check/core/bloc/cubit/global_state.dart';
import 'package:health_check/core/utils/app_colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: BlocBuilder<GlobalCubit, GlobalState>(
                  builder: (context, state) {
                final cubit = BlocProvider.of<GlobalCubit>(context);

                return Icon(
                  Icons.arrow_back_ios,
                  size: 35,
                  color: cubit.isDark ? AppColors.white : AppColors.black,
                );
              }),
            ),
          ),
        ),
        Text(
          text,
          style:
              Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 30),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
