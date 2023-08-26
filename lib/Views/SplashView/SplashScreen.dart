import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/Utils/Assets/asset_image.dart';
import 'package:todo_list_app/Utils/Colors/AppColors.dart';

import '../../ViewModels/SplashViewModels/splashServices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices srevices = SplashServices();
  @override
  void initState() {
    //implement initState
    srevices.moveToHome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightpurpleColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Image(image: AssetImage(ImageAsset.applogo))),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
            'Todo List App',
            style: GoogleFonts.caveat(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: AppColor.darkpurpleColor),
          )
        ],
      ),
    );
  }
}
