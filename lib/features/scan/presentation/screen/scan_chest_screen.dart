import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/utils/app_assets.dart';
import 'package:health_check/core/utils/app_strings.dart';
import 'package:health_check/core/widget/app_bar_widget.dart';
import 'package:health_check/core/widget/back_ground_color_widget.dart';
import 'package:health_check/core/widget/custom_buttom.dart';
import 'package:health_check/features/scan/presentation/component/show_result_scan_alert_dialog_component.dart';
import '../../../../core/utils/app_colors.dart';
import '../component/upload_image_alert_dialog_component.dart';
import '../cubit/chest_cubit/chest_cubit.dart';
import '../cubit/chest_cubit/chest_state.dart';

class ScanXrayChest extends StatelessWidget {
  const ScanXrayChest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanXrayChestCubit, ScanXrayChestState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ScanXrayChestCubit>(context);

        return PopScope(
          canPop: true,
          //When false, blocks the current route from being popped.
          onPopInvoked: (didPop) {
            cubit.croppedImageFile = null;
          },
          child: SafeArea(
            child: Scaffold(
              body: BackGroundColorWidget(
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      const AppBarWidget(text: AppStrings.xRayChestTwo),

                      // Image OR upload Image
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: cubit.croppedImageFile == null
                              ? SizedBox(
                                  width: 405.w,
                                  height: 425.h,
                                  child: Image.asset(
                                    AppAssets.scanChestXray,
                                  ),
                                )
                              : SizedBox(
                                  width: double.infinity,
                                  height: 300.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.file(
                                      cubit.croppedImageFile!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                        ),
                      ),

                      SizedBox(
                        height: 30.h,
                      ),

                      FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Row(
                            children: [
                              CustomButton(
                                background: AppColors.primary,
                                height: 60.h,
                                width: 200.w,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return UploadImageAlertDialogComponent(
                                          cubit: cubit,
                                        );
                                      });
                                },
                                text: AppStrings.upload,
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              CustomButton(
                                background: AppColors.primary,
                                height: 60.h,
                                width: 200.w,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      if (cubit.croppedImageFile == null) {
                                        return const ShowResultAlertDialogComponent(
                                          title: AppStrings.noImageSelected,
                                        );
                                      } else {
                                        return ShowResultAlertDialogComponent(
                                            title: cubit.result,titleTwo: cubit.result2,);
                                      }
                                    },
                                  );
                                },
                                text: AppStrings.scan,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// GestureDetector(
//   onTap: () {
//     pickedImage();
//   },
//   child: Container(
//     height: 55,
//     width: double.infinity,
//     decoration: BoxDecoration(
//       color: AppColors.primary,
//       borderRadius: BorderRadius.circular(15),
//     ),
//     child: const Center(
//       child: Text(
//         "Picked Image",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 18,
//         ),
//       ),
//     ),
//   ),
// ),

// // Result
// Column(
//   children: [
//     Align(
//       alignment: Alignment.topLeft,
//       child: Text(
//         'Result :$result',
//         style: const TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 22),
//       ),
//     ),
//     const SizedBox(
//       height: 20,
//     ),
//     Text(
//       result2 == null ? "" : "confidence :  $result2".toString(),
//       style: const TextStyle(fontSize: 25, color: Colors.black),
//     ),
//   ],
// ),
