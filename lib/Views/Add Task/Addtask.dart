import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/Services/HiveHelper/HiveHelper.dart';
import 'package:todo_list_app/Utils/Colors/AppColors.dart';
import 'package:todo_list_app/Utils/Utils.dart';
import 'package:todo_list_app/res/components/CommonTextFeilds.dart';
import 'package:todo_list_app/res/components/roundBtn.dart';

import '../../ViewModels/Controllers/adtaskController.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final adtaskController = Get.put(AdTaskController());
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final descrController = TextEditingController();

  @override
  void dispose() {
    //implement dispose
    super.dispose();
    titleController.dispose();
    dateController.dispose();
    timeController.dispose();
    descrController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.darkpurpleColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.whiteColor,
          ),
        ),
        title: Text(
          'Add New Task',
          style: GoogleFonts.dekko(fontSize: 20, color: AppColor.whiteColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.05,
            ),
            CommonTextFeild(
              title: 'Title',
              hint: 'Task Note',
              suffixIcon: const FaIcon(FontAwesomeIcons.book),
              controller: titleController,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Obx(() {
              return Row(
                children: [
                  Expanded(
                      child: CommonTextFeild(
                    readonly: true,
                    hint: Utils.dateFormated(
                        adtaskController.pickeddate.toString()),
                    title: 'Date',
                    onslected: () {
                      adtaskController.setDate();
                    },
                    suffixIcon: const FaIcon(FontAwesomeIcons.calendar),
                    controller: dateController,
                  )),
                  Expanded(
                      child: CommonTextFeild(
                    readonly: true,
                    hint: Utils.timeFormated(
                        adtaskController.pickedtime, context),
                    title: 'Time',
                    onslected: () {
                      adtaskController.setTime();
                    },
                    suffixIcon: const FaIcon(FontAwesomeIcons.clock),
                    controller: timeController,
                  ))
                ],
              );
            }),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CommonTextFeild(
              title: 'Description',
              hint: 'Details',
              maxlines: 6,
              suffixIcon: const FaIcon(FontAwesomeIcons.readme),
              controller: descrController,
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
              child: RoundBtn(
                  ontap: () {
                    timeController.text = Utils.timeFormated(
                        adtaskController.pickedtime, context);
                    dateController.text = Utils.dateFormated(
                        adtaskController.pickeddate.toString());
                    if (titleController.text.isEmpty &&
                        descrController.text.isEmpty) {
                      Get.snackbar(
                          'Empty Feilds', 'Please Enter the Task detals');
                    } else if (titleController.text.isEmpty) {
                      Get.snackbar(
                          'Empty Feilds', 'Please Enter the title of teh Task');
                    } else if (descrController.text.isEmpty) {
                      Get.snackbar(
                          'Empty Feilds', 'Please Enter the Task descriptions');
                    } else {
                      HiveHelper.addData(
                        titleController.text.toString(),
                        dateController.text.toString(),
                        timeController.text.toString(),
                        descrController.text.toString(),
                      );
                      Get.snackbar('Successfully', 'Task Added Successfully');
                    }
                  },
                  title: 'Add Task'),
            )
          ],
        ),
      ),
    );
  }
}
