import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 3)
class Task extends HiveObject {
  @HiveField(0)
  final String header;
  @HiveField(1)
  final String description;

  @HiveField(2)
  final String dateCreate;

  @HiveField(3)
  final String dateEdited;

  @HiveField(4)
  final bool priority;

  @HiveField(5)
  bool isDone;

  Task(
      {required this.header,
      required this.description,
      required this.dateCreate,
      required this.dateEdited,
      required this.priority,
      this.isDone = false});
}
