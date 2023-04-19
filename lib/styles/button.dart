import 'package:flutter/material.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: Size(290, 100),
  backgroundColor: Color.fromARGB(255, 0, 0, 0),
  elevation: 10,
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50))),
  textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  // animationDuration: const Duration(
  //     milliseconds: 1000),
  splashFactory: InkRipple.splashFactory,
);
c
