import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import '../../../../core/utils/app_colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        appBar: AppBar(
          title: const Text('COVID'),
        ),
        body: Padding(
          padding:
          const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: imageFile == null
                      ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        "Please select an image first",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.file(
                      imageFile!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    pickedImage();
                  },
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Picked Image",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft ,
                      child: Text(
                        'Result :$result'
                        ,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      result2 == null ? "" : "confidence :  $result2".toString(),
                      style: const TextStyle(fontSize: 25,color: Colors.black),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}