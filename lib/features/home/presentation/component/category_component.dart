
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({
    super.key,
    this.onTap,
    required this.url,
    required this.title,
  });
  final void Function()? onTap;
  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Container(
        height: 250.h,
        width: 200.w,
        decoration:  BoxDecoration(
          color: AppColors.lightBlue.withOpacity(0.6),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          children: [
            Image.asset(
              url,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
