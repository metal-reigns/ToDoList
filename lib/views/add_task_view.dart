import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_andronick/constants/colors.dart';
import 'package:todo_list_andronick/view_models/app_view_model.dart';
import 'package:todo_list_andronick/views/bottom_sheets/add_task_bottom_sheet_view.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return SizedBox(
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: clrLvl3,
                foregroundColor: clrLvl1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {
              viewModel.bottomSheetBuilder(
                  const AddTaskBottomSheetView(), context);
            },
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}
