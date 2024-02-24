import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import '../../../../../core/utils/app_colors.dart';
import 'chest_state.dart';

class ScanXrayChestCubit extends Cubit<ScanXrayChestState> {
  ScanXrayChestCubit() : super(ScanXrayInitial());

  File? imageFile;
  File? croppedImageFile;
  List predictions = [];
  String result = ' ';
  double? result2;

  String? model;
  String? label;


  void pickedImage({
    required ImageSource source,
    String? route,
    dynamic arg,
    context,
  }) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      await cropImage();
      doImageClassification();
      emit(TakeImageFromUserState());

      // if(croppedImageFile != null){
      //   navigate(context: context, route: route!, arg: arg);
      // }


    } else {

      if (kDebugMode) {
        print('Not Select Image');
      }

    }
  }

  Future<void> cropImage() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile!.path,
      uiSettings: [
        AndroidUiSettings(
          backgroundColor: AppColors.primary,
          activeControlsWidgetColor: AppColors.primary,
          toolbarTitle: 'Cropper',
          toolbarColor: AppColors.primary,
          toolbarWidgetColor: AppColors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      croppedImageFile = File(croppedFile.path);
      emit(TakeImageCropperFromUserState());
    }
  }

  void loadDataModelFile() async {
    String? output = await Tflite.loadModel(
      model: model!,
      labels: label!,
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    print(output);
  }

  void doImageClassification() async {
    var recognitions = await Tflite.runModelOnImage(
      path: croppedImageFile!.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 1,
      threshold: 0.1,
      asynch: true,
    );
    print(recognitions!.length.toString());
      result = " ";
    recognitions.forEach((element) {
        print(element.toString());
        result += element['label'];
        result2 = element['confidence'] as double;
        // result2 * 100 => عشان نظهر كام في الميه بالظبط

      },
    );
  }
}
