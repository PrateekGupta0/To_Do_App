import 'package:flutter/material.dart';
import 'package:todolistapp/models/task_data.dart';
import 'package:todolistapp/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/models/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

