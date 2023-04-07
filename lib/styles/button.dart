import 'package:flutter/material.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: Size(290, 50),
  backgroundColor: Color.fromARGB(255, 0, 0, 0),
  elevation: 70,

  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50))),
  textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  // animationDuration: const Duration(
  //     milliseconds: 1000),
  splashFactory: InkRipple.splashFactory,
);
