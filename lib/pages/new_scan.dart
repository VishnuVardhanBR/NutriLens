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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () => pickImage(ImageSource.camera),
                    child: Text("Take Photo")),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () => pickImage(ImageSource.gallery),
                    child: Text("Choose Photo"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
