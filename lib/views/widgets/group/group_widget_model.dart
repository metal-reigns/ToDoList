import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/models/entity/group.dart';
import 'package:todo_list/models/services/hive_manager.dart';
import 'package:todo_list/views/navigation/main_navigation.dart';

class GroupWidgetModel extends ChangeNotifier {
  late final Future<Box<Group>> _box;
  ValueListenable<Object>? _lisableBox;
  var _groups = <Group>[];

  List<Group> get groups => _groups.toList();

  GroupWidgetModel() {
    _setup();
  }

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationRouteNames.groupsFrom);
  }

  void showTasks(BuildContext context, int groupIndex) async {
    final groupKey = (await _box).keyAt(groupIndex) as int;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.tasks,
      arguments: groupKey,
    );
  }

  void deleteGroup(int groupIndex) async {
    final box = await _box;
    final groupKey = box.keyAt(groupIndex) as int;
    await Hive.deleteBoxFromDisk(
        HiveManager.instance.makeTaskBoxName(groupKey));
    await box.delete(groupKey);
  }

  void _readGroupsFromHive() async {
    _groups = (await _box).values.toList();
    notifyListeners();
  }

  void _setup() async {
    _box = HiveManager.instance.openGroupBox();
    print((await _box).path);
    _readGroupsFromHive();
    _lisableBox = (await _box).listenable();
    _lisableBox?.addListener(_readGroupsFromHive);
  }

  @override
  void dispose() async {
    _lisableBox?.removeListener(_readGroupsFromHive);
    await HiveManager.instance.closeBox((await _box));
    super.dispose();
  }
}

class GroupWidgetModelProvider extends InheritedNotifier {
  final GroupWidgetModel model;
  const GroupWidgetModelProvider({
    super.key,
    required this.model,
    required super.child,
  }) : super(
          notifier: model,
        );

  static GroupWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupWidgetModelProvider>();
  }

  static GroupWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GroupWidgetModelProvider>()
        ?.widget;
    return widget is GroupWidgetModelProvider ? widget : null;
  }
}
