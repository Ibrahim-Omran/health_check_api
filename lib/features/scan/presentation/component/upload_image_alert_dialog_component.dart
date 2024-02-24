import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/utils/app_colors.dart';
import 'package:health_check/core/utils/app_strings.dart';
import 'package:health_check/features/scan/presentation/component/select_from_camera_or_gallery_component.dart';
import 'package:health_check/features/scan/presentation/cubit/chest_cubit/chest_cubit.dart';
import 'package:image_picker/image_picker.dart';


class UploadImageAlertDialogComponent extends StatelessWidget {
  const UploadImageAlertDialogComponent({super.key, required this.cubit});

  final ScanXrayChestCubit cubit ;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        AppStrings.selectImageFrom,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize:20),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            children: [

              SelectFromCameraOrGalleryComponent(
                text: AppStrings.camera,
                icon: Icons.camera_alt,
                onPressed: (){
                  cubit.pickedImage(source: ImageSource.camera);
                  Navigator.pop(context);
                }
              ),


             const Spacer(),
              Container(
                color: AppColors.grey,
                height: 60.h,
                width: 2.w,
              ),
              const Spacer(),

              SelectFromCameraOrGalleryComponent(
                text: AppStrings.gallery,
                icon: Icons.image,
                onPressed: (){
                  cubit.pickedImage(source: ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),


            ],
          ),
        )
      ],
    );
  }
}
