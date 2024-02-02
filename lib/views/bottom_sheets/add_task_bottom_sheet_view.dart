import 'package:flutter/material.dart';
import 'package:todo_list/constants/colors.dart';

class AddTaskBottomSheetView extends StatelessWidget {
  const AddTaskBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 80,
        child: Center(
          child: SizedBox(
            height: 40,
            width: 250,
            child: TextField(
              onSubmitted: (value) {
                if (entryController.text.isNotEmpty) {
                  // Task newTask = Task(entryController.text, false);
                  // viewModel.addTask(newTask);
                  entryController.clear();
                }
                Navigator.of(context).pop();
              },
              controller: entryController,
              autofocus: true,
              autocorrect: false,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              cursorColor: clrLvl4,
              style: TextStyle(color: clrLvl4, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 5),
                filled: true,
                fillColor: clrLvl2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
