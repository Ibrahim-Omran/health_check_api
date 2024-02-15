
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_check/core/utils/app_colors.dart';
import 'package:health_check/core/widget/custom_buttom.dart';
import 'package:health_check/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:health_check/features/home/presentation/cubit/home_cubit/home_state.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<HomeCubit,HomeState>(
              builder: (context,state){
                final cubit = BlocProvider.of<HomeCubit>(context);
            return  Column(
              children: [
                SizedBox(height: 30,),

                Text(
                  'Theme',
                  style: Theme.of(context).textTheme.displayLarge,
                ),

                SwitchListTile(
                  secondary: const Icon(Icons.sunny,color: Colors.yellow,),
                  title:  Text(cubit.isDark? "Dark Mode" : "Lite Mode", style: Theme.of(context).textTheme.displayLarge, ),
                  value: cubit.isDark ? true : false,
                  onChanged: (value){
                    cubit.changeTheme();
                  },
                ),




              ],
            );
          }),
        ),

      ),
    );
  }
}
