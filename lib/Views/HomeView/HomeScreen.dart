// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/Models/todolistModel.dart';
import 'package:todo_list_app/Services/HiveHelper/HiveHelper.dart';
import 'package:todo_list_app/Utils/Colors/AppColors.dart';
import 'package:todo_list_app/Utils/Utils.dart';
import 'package:todo_list_app/Views/Add%20Task/Addtask.dart';
import 'package:todo_list_app/res/components/roundBtn.dart';

import '../../Services/Boxes/boxes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppColor color = AppColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: Get.height * 0.3,
              width: Get.width,
              color: AppColor.darkpurpleColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Utils.dateFormated(DateTime.now().toString()),
                      style: GoogleFonts.dekko(
                          color: AppColor.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      'My Todo App',
                      style: GoogleFonts.dekko(
                          color: AppColor.whiteColor,
                          fontSize: 40,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.02,
                          vertical: Get.height * 0.01),
                      width: Get.width,
                      height: Get.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.lightpurpleColor,
                      ),
                      child: ValueListenableBuilder(
                        valueListenable: Boxes.getData().listenable(),
                        builder: (context, box, child) {
                          var data = box.values.toList().cast<TodoListModel>();
                          var incompleteTasks =
                              data.where((task) => !task.completed).toList();
                          var completedTasks =
                              data.where((task) => task.completed).toList();
                          if (incompleteTasks.isNotEmpty) {
                            return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: incompleteTasks.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    incompleteTasks.isNotEmpty
                                        ? ListTile(
                                            onTap: () {
                                              HiveHelper.deleteData(
                                                  data[index]);
                                            },
                                            leading: CircleAvatar(
                                                radius: 20,
                                                backgroundColor:
                                                    color.getRandomColor(),
                                                child: const Icon(
                                                  FontAwesomeIcons.edit,
                                                  size: 18,
                                                  color:
                                                      AppColor.lightpurpleColor,
                                                )),
                                            title: Text(
                                              data[index].title.toString(),
                                              style: GoogleFonts.dekko(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            subtitle: Text(
                                              data[index]
                                                  .time
                                                  .toString(),
                                              style: GoogleFonts.dekko(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            trailing: Checkbox(
                                              value: data[index].completed,
                                              onChanged: (value) {
                                                data[index].completed = value!;
                                                data[index].save();
                                                box.put(data[index].key,
                                                    data[index]);
                                              },
                                            ),
                                          )
                                        : const Center(
                                            child: Text('Create the new task')),
                                    incompleteTasks.isNotEmpty
                                        ? const Divider(
                                            thickness: 2.0,
                                            endIndent: 25,
                                            indent: 25,
                                          )
                                        : const Text('')
                                  ],
                                );
                              },
                            );
                          } else {
                            return const Center(child: Text('Create a New task'));
                          }
                        },
                      )),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Completed',
                      style: GoogleFonts.dekko(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.02,
                          vertical: Get.height * 0.01),
                      width: Get.width,
                      height: Get.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.lightpurpleColor,
                      ),
                      child: ValueListenableBuilder(
                        valueListenable: Boxes.getData().listenable(),
                        builder: (context, box, child) {
                          var data = box.values.toList().cast<TodoListModel>();
                          var incompleteTasks =
                              data.where((task) => !task.completed).toList();
                          var completedTasks =
                              data.where((task) => task.completed).toList();
                          if(completedTasks.isNotEmpty){
                            return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: completedTasks.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  completedTasks.isNotEmpty
                                      ? ListTile(
                                          onTap: () {
                                            HiveHelper.deleteData(data[index]);
                                          },
                                          leading: CircleAvatar(
                                              radius: 20,
                                              backgroundColor:
                                                  color.getRandomColor(),
                                              child: const Icon(
                                                FontAwesomeIcons.edit,
                                                size: 18,
                                                color:
                                                    AppColor.lightpurpleColor,
                                              )),
                                          title: Text(
                                            data[index].title.toString(),
                                            style: GoogleFonts.dekko(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          subtitle: Text(
                                            data[index].time.toString(),
                                            style: GoogleFonts.dekko(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          trailing: Checkbox(
                                            value: data[index].completed,
                                            onChanged: (value) {
                                              data[index].completed = value!;
                                              data[index].save();
                                              box.put(
                                                  data[index].key, data[index]);
                                            },
                                          ),
                                        )
                                      : const Text('No Completd Task'),
                                  const Divider(
                                    thickness: 2.0,
                                    endIndent: 25,
                                    indent: 25,
                                  )
                                ],
                              );
                            },
                          );
                          }else{
                            return const Center(
                              child: Text('No Completed Task'));
                          }
                        },
                      )),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  RoundBtn(
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddTask(),
                            ));
                      },
                      title: 'Add New Task')
                ],
              ),
            ))
      ],
    ));
  }
}
