import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/utils/app_colors.dart';
import 'package:health_check/core/widget/app_bar_widget.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widget/back_ground_color_widget.dart';
import '../component/contacts_component.dart';
import '../component/floating_action_button_component.dart';
import '../cubit/contacts_cubit.dart';
import '../cubit/contacts_state.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const FloatingActionButtonComponent(),
        body: BackGroundColorWidget(
          widget: BlocBuilder<ContactsCubit, ContactsState>(
              builder: (context, state) {
                final cubit = BlocProvider.of<ContactsCubit>(context);
                return Column(
                  children: [

                    const AppBarWidget(text: AppStrings.emergency),


                    Container(
                      height: 50.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black),
                        color: AppColors.primary.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          AppStrings.contacts,
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            fontSize: 18,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30.w,
                    ),


                    // list contacts
                    Expanded(
                      child: ListView.builder(
                        itemCount: cubit.contactsList.length,
                        itemBuilder: (context, index) {
                          return ContactsComponent(
                            cubit: cubit,
                            contactsModel: cubit.contactsList[index],
                          );
                        },
                      ),
                    ),

                  ],
                );
              }),
        ),
      ),
    );
  }
}
