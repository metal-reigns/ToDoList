import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/models/entity/group.dart';
import 'package:todo_list/models/entity/task.dart';
import 'package:todo_list/models/services/hive_manager.dart';
import 'package:todo_list/views/navigation/main_navigation.dart';

class TaskWidgetModel extends ChangeNotifier {
  int groupKey;
  late final Future<Box<Task>> _box;
  ValueListenable<Object>? _lisableBox;
  var _tasks = <Task>[];

  List<Task> get tasks => _tasks.toList();

  Group? _group;
  Group? get group => _group;

  TaskWidgetModel({required this.groupKey}) {
    _setup();
  }

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.tasksForm,
      arguments: groupKey,
    );
  }

  Future<void> deleteTask(int taskIndex) async {
    return (await _box).deleteAt(taskIndex);
  }

  Future<void> doneToggle(int taskIndex) async {
    final box = await _box;
    final task = box.getAt(taskIndex);
    task?.isDone = !task.isDone;
    await task?.save();
  }

  Future<void> _readTasksFromHive() async {
    _tasks = (await _box).values.toList();
    notifyListeners();
  }

  Future<void> _setup() async {
    _box = HiveManager.instance.openTaskBox(groupKey);
    await _readTasksFromHive();
    _lisableBox = (await _box).listenable();
    _lisableBox?.addListener(_readTasksFromHive);
  }

  @override
  void dispose() async {
    _lisableBox?.removeListener(_readTasksFromHive);
    await HiveManager.instance.closeBox((await _box));

    super.dispose();
  }
}

class TaskWidgetModelProvider extends InheritedNotifier {
  final TaskWidgetModel model;
  const TaskWidgetModelProvider({
    super.key,
    required this.model,
    required super.child,
  }) : super(
          notifier: model,
        );

  static TaskWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TaskWidgetModelProvider>();
  }

  static TaskWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TaskWidgetModelProvider>()
        ?.widget;
    return widget is TaskWidgetModelProvider ? widget : null;
  }
}
