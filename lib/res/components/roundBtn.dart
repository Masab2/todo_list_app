// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/Utils/Colors/AppColors.dart';

class RoundBtn extends StatelessWidget {
  VoidCallback ontap;
  String title;
  RoundBtn({super.key, required this.ontap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: Get.height * 0.06,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.darkpurpleColor,
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.dekko(fontSize: 20, color: AppColor.whiteColor),
          ),
        ),
      ),
    );
  }
}
