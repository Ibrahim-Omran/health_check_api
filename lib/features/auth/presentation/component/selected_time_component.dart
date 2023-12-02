import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/utils/app_strings.dart';
import 'package:health_check/features/auth/presentation/component/text_field_component.dart';
import 'package:iconly/iconly.dart';

import '../cubit/signup_doctor_cubit/sign_up_doctor_cubit.dart';

class SelectedTimeComponent extends StatelessWidget {
  const SelectedTimeComponent({
    super.key,
    required this.cubit,
  });

  final SignUpDoctorCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [


        // start time
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // start time
              Text(
                AppStrings.startTime,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextFieldComponent(
                readOnly: true,
                icon: IconlyLight.time_circle,
                hintText: cubit.startTime,
                iconSuffix: Icons.timer_outlined,
                suffixIconOnPressed: ()async{
                  cubit.getStartTime(context);
                },

              )
                  .animate()
                  .fade(delay: 250.ms)
                  .slideX(duration: 1.seconds),
            ],
          ),
        ),

        SizedBox(
          width: 30.h,
        ),

        // end time
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // start time
              Text(
                AppStrings.endTime,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextFieldComponent(
                icon: IconlyLight.time_circle,
                readOnly: true,
                hintText: cubit.endTime,
                iconSuffix: Icons.timer_outlined,
                suffixIconOnPressed: ()async{
                  cubit.getEndTime(context);
                },
              )
                  .animate()
                  .fade(delay: 250.ms)
                  .slideX(duration: 1.seconds),
            ],
          ),
        ),

      ],
    );
  }
}
