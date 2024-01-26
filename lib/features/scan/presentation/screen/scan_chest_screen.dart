import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_check/core/utils/app_assets.dart';
import 'package:health_check/core/utils/app_strings.dart';
import 'package:health_check/core/widget/back_ground_color_widget.dart';
import 'package:health_check/core/widget/custom_buttom.dart';
import 'package:health_check/features/scan/presentation/component/show_result_scan_alert_dialog_component.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import '../../../../core/utils/app_colors.dart';
import '../component/upload_image_alert_dialog_component.dart';

class ScanXrayChest extends StatefulWidget {
  const ScanXrayChest({Key? key}) : super(key: key);

  @override
  State<ScanXrayChest> createState() => _ScanXrayState();
}

class _ScanXrayState extends State<ScanXrayChest> {
  File? imageFile;
  List predictions = [];
  ImagePicker? imagePicker;
  String result = ' ';
  double? result2;

  void pickedImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          imageFile = File(pickedImage.path);
          doImageClassification();
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  loadDataModelFile() async {
    String? output = await Tflite.loadModel(
      model: 'assets/models/model_unquant.tflite',
      labels: 'assets/models/labels.txt',
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    print(output);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
    loadDataModelFile();
  }

  doImageClassification() async {
    var recognitions = await Tflite.runModelOnImage(
        path: imageFile!.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 1,
        threshold: 0.1,
        asynch: true);
    print(recognitions!.length.toString());
    setState(() {
      result = " ";
    });
    recognitions.forEach((element) {
      setState(() {
        print(element.toString());
        result += element['label'];
        result2 = element['confidence'] as double;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const BackGroundColorWidget(text: AppStrings.xRayChestTwo),

              // Image OR upload Image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: imageFile == null
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
                              imageFile!,
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
                          onPressed: (){
                            pickedImage();
                          },
                          text: 'Upload',
                      ),
                
                       SizedBox(
                        width: 30.w,
                      ),
                
                      CustomButton(
                        background: AppColors.primary,
                        height: 60.h,
                        width: 200.w,
                        onPressed: (){
                            showDialog(context: context,
                              builder: (context) {
                              
                              if(imageFile == null) {
                                  return const ShowResultAlertDialogComponent(title: 'No Image Selected !',) ;
                                }
                              else{
                                return  ShowResultAlertDialogComponent(title: result) ;
                              }
                              },);
                        },
                        text: 'Scan',
                      ),
                
                    ],
                  ),
                ),
              ),

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
            ],
          ),
        ),
      ),
    );
  }
}
