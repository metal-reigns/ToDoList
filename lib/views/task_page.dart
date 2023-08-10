import 'package:flutter/material.dart';
import 'package:todo_list_andronick/views/add_task_view.dart';
import 'package:todo_list_andronick/views/header_view.dart';
import 'package:todo_list_andronick/views/task_info_view.dart';
import 'package:todo_list_andronick/views/task_list_view.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Name And Setting View
            Expanded(flex: 1, child: HeaderView()),
            // Task Info View
            Expanded(flex: 1, child: TaskInfoView()),
            // Task List View
            Expanded(flex: 7, child: TaskListView()),
          ],
        ),
      ),
      floatingActionButton: AddTaskView(),
    );
  }
}
