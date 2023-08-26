// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdTaskController extends GetxController {
  var pickedDate = DateTime.now().obs;
  var pickedTime = TimeOfDay.now().obs;

  get pickeddate => pickedDate.value;
  get pickedtime => pickedTime.value;

  void setDate() async {
    DateTime? newPickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: pickedDate.value,
      firstDate: DateTime(2023),
      lastDate: DateTime(3000),
    );

    if (newPickedDate != null && newPickedDate != pickedDate.value) {
      pickedDate.value = newPickedDate;
      debugPrint(pickedDate.value.toString());
    }
  }

  void setTime() async {
    TimeOfDay? newpickedTime = await showTimePicker(
        context: Get.context!, initialTime: TimeOfDay.now());
    if (newpickedTime != null && newpickedTime != pickedTime.value) {
      pickedTime.value = newpickedTime;
      debugPrint(pickedDate.value.toString());
    }
  }
}
