import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/routes/app_routes.dart';
import '../core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(429, 926),
      builder: (context,state){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: getAppTheme(),
          initialRoute: Routes.intitlRoute,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
