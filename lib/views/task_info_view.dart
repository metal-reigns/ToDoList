import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_andronick/constants/colors.dart';
import 'package:todo_list_andronick/view_models/app_view_model.dart';

class TaskInfoView extends StatelessWidget {
  const TaskInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        // Total Tasks
        return Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: clrLvl2, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text(
                              '${viewModel.numTasks}',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: clrLvl3,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: FittedBox(
                            child: Text(
                              'Total tasks',
                              style: TextStyle(
                                  color: clrLvl4, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                width: 20,
              ),
              // Remaining
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: clrLvl2, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text(
                              '${viewModel.numTasksRemaining}',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: clrLvl3,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: FittedBox(
                            child: Text(
                              'Remaining',
                              style: TextStyle(
                                  color: clrLvl4, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
