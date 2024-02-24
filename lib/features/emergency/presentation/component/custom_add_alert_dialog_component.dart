
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/features/emergency/presentation/cubit/contacts_cubit.dart';
import 'package:health_check/features/emergency/presentation/cubit/contacts_state.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widget/custom_buttom.dart';
import '../../../../core/widget/custom_text_form_field.dart';

class CustomAlertDialogComponent extends StatelessWidget {
  const CustomAlertDialogComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit,ContactsState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ContactsCubit>(context);
        return AlertDialog(
          // content
          content: SizedBox(
            height: 250.h,
            child: Form(
                  key: cubit.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text(
                          AppStrings.name,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppColors.black,fontSize: 25),
                        ),
                              
                        SizedBox(
                          height: 8.h,
                        ),
                              
                        // Name Contacts
                        CustomTextFormField(
                          controller: cubit.nameController,
                          enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.pleaseEnterValidName;
                            }
                            return null;
                          },
                        ),
                              
                        SizedBox(
                          height: 8.h,
                        ),
                              
                        // Phone
                        Text(
                          AppStrings.phone,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppColors.black,fontSize: 25),
                        ),
                              
                        SizedBox(
                          height: 8.h,
                        ),
                              
                        // Number Contacts
                        CustomTextFormField(
                          controller: cubit.numberController,
                          enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.length >= 12) {
                              return AppStrings.pleaseEnterValidNumber;
                            }
                            return null;
                          },
                        ),
                              
                      ],
                    ),
                  ),
                ),
          ),
          actions: [
            // Save Button
            CustomButton(
              onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.insertContacts();
                  Navigator.pop(context);
                }

              },
              text: AppStrings.save,
            )
          ],
        );
      }
    );
  }
}
