import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/features/emergency/presentation/cubit/contacts_cubit.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widget/custom_buttom.dart';
import '../../data/model/contacts_model.dart';
import 'delete_alert_dialog_component.dart';

class ContactsComponent extends StatelessWidget {
  const ContactsComponent({
    super.key, required this.contactsModel, required this.cubit,
  });

  final ContactsCubit cubit;
  final ContactsModel contactsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      child: InkWell(
        onLongPress: (){
          // Delete AlertDialog
          showDialog(context: context,
            builder: (context) {
            return DeleteAlertDialogComponent(cubit: cubit, contactsModel: contactsModel);
          },);
        },
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          width: double.infinity,
          decoration:  BoxDecoration(
            border: Border.all(color: AppColors.black),
            color: AppColors.colorContacts,
            borderRadius: BorderRadius.circular(20),

          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [

                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name Contacts
                      Text(
                        contactsModel.name,
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.black),
                      ),

                      SizedBox(
                        height: 5.h,
                      ),

                      // Icon calling and phone number
                      Row(
                        children: [

                          const Icon(
                            IconlyLight.calling,
                            size: 29,
                          ),

                          SizedBox(
                            width: 10.w,
                          ),

                          // Phone Number
                          Flexible(
                            child: Text(
                              contactsModel.number,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.black),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                // Calling Button
                Flexible(
                  flex: 2,
                  child: CustomButton(
                    width: 150,
                    height: 60,
                    background: AppColors.green,
                    onPressed: () async{
                      // call now
                      cubit.makePhoneCall(contactsModel.number.toString());
                      },
                    text: AppStrings.callNow,
                    fontSize: 20.spMin,
                    fontWeight: FontWeight.w500,


                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
