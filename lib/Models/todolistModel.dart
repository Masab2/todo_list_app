import 'package:hive/hive.dart';
part 'todolistModel.g.dart';

@HiveType(typeId: 0)
class TodoListModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String date;

  @HiveField(2)
  String time;

  @HiveField(3)
  String description;
  
  @HiveField(4)
  bool completed;

  TodoListModel(
      {required this.title,
      required this.date,
      required this.time,
      required this.description,
      this.completed = false});
}
