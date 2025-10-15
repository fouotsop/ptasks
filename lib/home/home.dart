import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:ptasks_repository/ptasks_repository.dart' show TaskService;

import '../task/pages/list_tasks.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ptasks')),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskPage(
                  taskService: Provider.of<TaskService>(context, listen: false),
                ),
              ),
            );
          },
          child: Text("Go to task"),
        ),
      ),
    );
  }
}
