import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widget/custom_buttom.dart';
import '../../data/model/contacts_model.dart';
import '../cubit/contacts_cubit.dart';

class DeleteAlertDialogComponent extends StatelessWidget {
  const DeleteAlertDialogComponent({
    super.key,
    required this.cubit,
    required this.contactsModel,
  });

  final ContactsCubit cubit;
  final ContactsModel contactsModel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        AppStrings.delete,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 25),
      ),
      actions: [
        Center(
          child: CustomButton(
            text: AppStrings.delete,
            onPressed: (){
              cubit.deleteContacts(contactsModel.id);
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
