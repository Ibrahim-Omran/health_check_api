import 'package:flutter/material.dart';
import '../../../../core/widget/custom_buttom.dart';

class ShowResultAlertDialogComponent extends StatelessWidget {
  const ShowResultAlertDialogComponent({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      actions: [
        Center(
          child: CustomButton(
            text: 'OK',
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
