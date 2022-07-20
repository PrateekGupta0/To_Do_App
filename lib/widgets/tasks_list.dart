import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
                isChecked: taskData.tasks[index].isDone,
                taskTitle: taskData.tasks[index].name,
                checkboxCallback: (bool? checkBoxState) {
                  taskData.updateTask(taskData.tasks[index]);
                },
            longPressCallback: (){
                  taskData.deletetask(taskData.tasks[index]);
            },);
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
