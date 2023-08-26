import 'dart:math';

import 'package:flutter/material.dart';

class AppColor {
  static const Color lightpurpleColor = Color(0xffE8DDFF);
  static Color darkpurpleColor = Colors.deepPurple.shade900;
  static const Color whiteColor = Colors.white;
  final Random random = Random();

  Color getRandomColor() {
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
