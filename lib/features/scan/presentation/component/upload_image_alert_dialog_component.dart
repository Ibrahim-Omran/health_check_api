import 'package:flutter/material.dart';
import '../../../../core/widget/custom_buttom.dart';

class UploadImageAlertDialogComponent extends StatelessWidget {
  const UploadImageAlertDialogComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        'No Image Selected !',
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
