// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Colors/AppColors.dart';

class CommonTextFeild extends StatelessWidget {
  String? hint;
  String title;
  Widget suffixIcon;
  int? maxlines;
  bool readonly;
  VoidCallback? onslected;
  TextEditingController controller;
  CommonTextFeild(
      {super.key,
      this.hint,
      required this.controller,
      this.onslected,
      this.readonly = false,
      required this.title,
      required this.suffixIcon,
      this.maxlines});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(title,
                  style: GoogleFonts.dekko(
                      fontSize: 23, fontWeight: FontWeight.bold)),
              IconButton(onPressed: onslected, icon: suffixIcon)
            ],
          ),
          TextFormField(
            controller: controller,
            readOnly: readonly,
            maxLines: maxlines,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.03, vertical: Get.height * 0.02),
                filled: true,
                fillColor: AppColor.lightpurpleColor.withOpacity(0.45),
                hintText: hint,
                hintStyle: GoogleFonts.dekko(fontSize: 18),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    );
  }
}
