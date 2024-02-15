import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:health_check/features/home/presentation/cubit/home_cubit/home_state.dart';

import '../core/routes/app_routes.dart';
import '../core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(429, 926),
      builder: (context,state){
        return BlocBuilder<HomeCubit,HomeState>(builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            theme: getAppTheme(),
            darkTheme: getAppDarkTheme(),

            themeMode: BlocProvider.of<HomeCubit>(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,

            title: 'Flutter Demo',
            // theme: getAppDarkTheme(),
            initialRoute: Routes.intitlRoute,
            onGenerateRoute: AppRoutes.generateRoute,

          );
        });
      },
    );
  }
}
