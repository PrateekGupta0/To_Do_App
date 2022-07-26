import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolistapp/widgets/tasks_list.dart';
import 'package:todolistapp/widgets/tasks_tile.dart';
import 'package:todolistapp/screens/add_task_screen.dart';
import 'package:todolistapp/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/models/task_data.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: (){
          //here we want that bottom sheet pop up.->Modal bottom sheet.\
          showModalBottomSheet(context: context, builder: (context) => AddTaskScreen((newTaskTitle){
           if(newTaskTitle!=null){
             // setState(() {
             //   tasks.add(Task(name: newTaskTitle));
             // });
             Navigator.pop(context);
           }
          }));
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Todoey',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700,
                ),),
                Text('${Provider.of<TaskData>(context).tasks.length} tasks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight:Radius.circular(20.0) ),
              ),
              child: TaskList(),
            ),
          )
        ],
      ),
    );
  }
}


