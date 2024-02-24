import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/utils/app_assets.dart';
import 'package:health_check/core/utils/commons.dart';
import 'package:health_check/features/scan/presentation/cubit/chest_cubit/chest_cubit.dart';
import 'package:health_check/features/scan/presentation/cubit/chest_cubit/chest_state.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widget/app_bar_widget.dart';
import '../../../../core/widget/back_ground_color_widget.dart';
import '../component/scan_x_ray_component.dart';

class ScanXRay extends StatelessWidget {
  const ScanXRay({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocBuilder<ScanXrayChestCubit,ScanXrayChestState>(
            builder: (context,state){
              final cubit = BlocProvider.of<ScanXrayChestCubit>(context);
              return Column(
                children: [

                  const AppBarWidget(text: AppStrings.xRayChestTwo),

                  ScanXRayComponent(
                    title: AppStrings.xRayChest,
                    image: AppAssets.chestXray,
                    onTap: () {
                      cubit.model = 'assets/models/model_v1.tflite';
                      cubit.label = 'assets/models/labels.txt';
                      cubit.loadDataModelFile();
                      navigate(context: context, route: Routes.chest);
                    },
                  ),

                  SizedBox(
                    height: 32.h,
                  ),

                  ScanXRayComponent(
                    title: AppStrings.xRaySkull,
                    image: AppAssets.skullXray,
                    onTap: () {
                      cubit.model = 'assets/models/model_v1.tflite';
                      cubit.label = 'assets/models/labels.txt';
                      cubit.loadDataModelFile();
                      navigate(context: context, route: Routes.xSkull);

                    },
                  ),
                ],
              );
            },
          )
      ),
    );
  }
}
