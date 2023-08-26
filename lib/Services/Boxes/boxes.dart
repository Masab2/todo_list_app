import 'package:hive/hive.dart';
import 'package:todo_list_app/Models/todolistModel.dart';

class Boxes {
  static Box<TodoListModel> getData() => Hive.box<TodoListModel>('todoList');
}
