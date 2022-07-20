import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/models/task.dart';
import 'package:todolistapp/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addtaskCallback;
  AddTaskScreen(this.addtaskCallback);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
            height: 20.0,
            ),
            Container(
              width: 250.0,
              child: TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText){
                  newTaskTitle=newText;
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 250.0,
              child: FlatButton(
                  onPressed: (){
                    Provider.of<TaskData>(context,listen: false).addTask(newTaskTitle!);
                    Navigator.pop(context);
                  },
                  child: Center(
                      child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                color: Colors.lightBlueAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
