import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class SelectFromCameraOrGalleryComponent extends StatelessWidget {
  const SelectFromCameraOrGalleryComponent({
    super.key,
    this.onPressed,
    this.icon,
    required this.text,
  });

  final void Function()? onPressed;
  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: AppColors.primary,
            size: 35,
          ),
        ),
        Text(
          text,
          style:
              Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
