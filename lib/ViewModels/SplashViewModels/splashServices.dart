import 'dart:async';

import 'package:flutter/material.dart';

import '../../Views/HomeView/HomeScreen.dart';

class SplashServices {
  void moveToHome(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    });
  }
}
