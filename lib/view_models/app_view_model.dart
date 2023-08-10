import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/task_model.dart';
import '../models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[];
  User user = User('Sarah');

  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  final _toDoBox = Hive.openBox('ToDoBox');

  int get numTasks => tasks.length;

  int get numTasksRemaining => tasks.where((elTask) => !elTask.complete).length;

  String get username => user.username;

  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  void updateUsername(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }

  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

  void deleteCompletedTasks() {
    tasks = tasks.where((elTask) => !elTask.complete).toList();
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: ((context) {
          return bottomSheetView;
        }));
  }
}
