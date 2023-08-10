import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_andronick/constants/colors.dart';
import 'package:todo_list_andronick/view_models/app_view_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Container(
        decoration: BoxDecoration(
          color: clrLvl2,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(15),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 15);
          },
          itemCount: viewModel.numTasks,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                viewModel.deleteTask(index);
              },
              background: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.red.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    Icons.delete,
                    color: Colors.red.shade700,
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: clrLvl1,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    side: BorderSide(width: 2, color: clrLvl3),
                    checkColor: clrLvl1,
                    activeColor: clrLvl3,
                    value: viewModel.getTaskValue(index),
                    onChanged: (value) {
                      viewModel.setTaskValue(index, value!);
                    },
                  ),
                  title: Text(
                    viewModel.getTaskTitle(index),
                    style: TextStyle(
                      color: clrLvl4,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
