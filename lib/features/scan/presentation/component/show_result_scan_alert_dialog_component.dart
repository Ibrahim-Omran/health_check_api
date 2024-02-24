import 'package:flutter/material.dart';
import '../../../../core/widget/custom_buttom.dart';

class ShowResultAlertDialogComponent extends StatelessWidget {
  const ShowResultAlertDialogComponent({super.key, required this.title,  this.titleTwo});

  final String title;
  final double? titleTwo;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        "$title\n ${titleTwo!*100}%",
        style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 20),
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
