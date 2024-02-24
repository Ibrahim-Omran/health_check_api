import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import 'custom_add_alert_dialog_component.dart';

class FloatingActionButtonComponent extends StatelessWidget {
  const FloatingActionButtonComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // show add alert dialog
        showDialog(
          context: context,
          builder: (context) {
            return const CustomAlertDialogComponent();
          },
        );
      },
      backgroundColor: AppColors.primary.withOpacity(0.8),
      child: const Icon(
        Icons.add,
        size: 25,
      ),
    );
  }
}
