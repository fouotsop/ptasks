import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptasks_repository/ptasks_repository.dart';

class Ptasks extends StatelessWidget {
  Ptasks({super.key});
  final _userService = UserService();
  final _taskService = TaskService();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => _userService,
      child: Provider(
        create: (context) => _taskService,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('Ptasks')),
            body: const Center(child: Text('Welcome to Ptasks!')),
          ),
        ),
      ),
    );
  }
}
