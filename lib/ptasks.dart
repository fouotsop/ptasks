import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptasks/home/home.dart';
import 'package:ptasks/task/bloc/task_bloc.dart';
import 'package:ptasks_repository/ptasks_repository.dart';

class Ptasks extends StatelessWidget {
  Ptasks({super.key});
  final _taskService = TaskService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return TaskBloc(taskService: _taskService);
      },
      child: MaterialApp(
        title: 'PTasks',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Home(),
      ),
    );
  }
}
