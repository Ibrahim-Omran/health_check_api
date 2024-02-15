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
      });
  }


}



// class ScanXrayChestState {
//   final File? imageFile;
//   final List predictions;
//   final String result;
//   final double? result2;
//
//   const ScanXrayChestState({
//     required this.imageFile,
//     required this.predictions,
//     required this.result,
//     required this.result2,
//   });
//
//   ScanXrayChestState copyWith({
//     File? imageFile,
//     List? predictions,
//     String? result,
//     double? result2,
//   }) {
//     return ScanXrayChestState(
//       imageFile: imageFile ?? this.imageFile,
//       predictions: predictions ?? this.predictions,
//       result: result ?? this.result,
//       result2: result2 ?? this.result2,
//     );
//   }
// }
//
// class ScanXrayChestCubit extends Cubit<ScanXrayChestState> {
//   final ImagePicker imagePicker = ImagePicker();
//
//   ScanXrayChestCubit()
//       : super( const ScanXrayChestState(
//     imageFile: null,
//     predictions: [],
//     result: '',
//     result2: null,
//   ));
//
//
//   void pickImage() async {
//     try {
//       final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
//       if (pickedImage != null) {
//         emit(state.copyWith(imageFile: File(pickedImage.path)));
//         doImageClassification();
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }
//
//
//   void loadDataModelFile() async {
//     String? output = await Tflite.loadModel(
//       model: 'assets/models/model_v1.tflite',
//       labels: 'assets/models/labels.txt',
//       numThreads: 1,
//       isAsset: true,
//       useGpuDelegate: false,
//     );
//     print(output);
//   }
//
//   void doImageClassification() async {
//     var recognitions = await Tflite.runModelOnImage(
//       path: state.imageFile!.path,
//       imageMean: 0.0,
//       imageStd: 255.0,
//       numResults: 1,
//       threshold: 0.1,
//       asynch: true,
//     );
//     print(recognitions!.length.toString());
//     emit(state.copyWith(result: " "));
//     recognitions.forEach((element) {
//       emit(state.copyWith(
//         result: state.result + element['label'],
//         result2: element['confidence'] as double,
//       ));
//     });
//   }
// }