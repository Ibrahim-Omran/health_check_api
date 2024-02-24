import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../core/utils/app_colors.dart';

class CustomGNavWidget extends StatelessWidget {
  const CustomGNavWidget({
    super.key,
    required this.currentIndex,
    this.onChanged,
    required this.tabs,
  });

  final int currentIndex;
  final Function(int)? onChanged;
  final List<GButton> tabs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        margin:  EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.navBarColor,
          borderRadius: BorderRadius.circular(60),
        ),
        child: GNav(
          activeColor: AppColors.white,
          selectedIndex: currentIndex,
          onTabChange: onChanged,
          tabBackgroundColor: AppColors.primary.withOpacity(0.8),
          tabBorderRadius: 26,
          padding: const EdgeInsets.all(16),
          gap: 8.w,
          tabs: tabs,
        ),
      ),
    );
  }
}
