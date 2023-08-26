// ignore_for_file: file_names

import 'dart:developer';

import 'package:get/get.dart';
import 'package:todo_list_app/Models/todolistModel.dart';
import 'package:todo_list_app/Services/Boxes/boxes.dart';

class HiveHelper {
  static Future<void> addData(var title, date, time, description) async {
    try {
      final data = TodoListModel(
        title: title,
        date: date,
        time: time,
        description: description,
        completed: false
      );
      log(data.title.toString());
      final box = Boxes.getData();
      box.add(data);
      data.save();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  static Future<void> deleteData(TodoListModel model) async {
    await model.delete();
  }
}
