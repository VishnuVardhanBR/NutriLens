import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutri_lens/styles/button.dart';

class NewScan extends StatefulWidget {
  const NewScan({super.key});
  @override
  State<NewScan> createState() => _NewScanState();
}

class _NewScanState extends State<NewScan> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
    } on PlatformException catch (e) {
      print("Failed to pick image");
    }
  }

  @override
  // void initState() {
  //   super.initState();
  //   loadModel();
  // }

  // Future loadModel() async {
  //   Tflite.close();
  //   String? res = await Tflite.loadModel(
  //     model: "assets/model/food_01_03_23.tflite",
  //     labels: "assets/model/labels.txt",
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: buttonPrimary,
                onPressed: () => pickImage(ImageSource.camera),
                child: const Text("Take Photo")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: buttonPrimary,
                onPressed: () => pickImage(ImageSource.gallery),
                child: const Text("Choose Photo"))
          ],
        ),
      ),
    );
  }
}
