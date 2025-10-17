import 'package:flutter/material.dart';

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
              MaterialPageRoute(builder: (context) => TaskPage()),
            );
          },
          child: Text("Go to task"),
        ),
      ),
    );
  }
}
