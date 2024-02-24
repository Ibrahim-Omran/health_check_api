import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BackGroundColorWidget extends StatelessWidget {
  const BackGroundColorWidget({super.key, required this.widget});

  final Widget widget ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary.withOpacity(0.7),
            AppColors.primary.withOpacity(0.4),
            AppColors.primary.withOpacity(0.1),
            AppColors.primary.withOpacity(0.01),
          ],
        ),
      ),

      child: widget,

    );
  }
}
