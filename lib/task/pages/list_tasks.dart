import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptasks/task/bloc/task_bloc.dart';

class TaskPage extends StatelessWidget {
  TaskPage({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQLite Task Manager")),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(hintText: "Enter task"),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          context.read<TaskBloc>().add(
                            TaskAdded(title: _controller.text),
                          );
                          _controller.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (context, index) {
                    final task = state.tasks[index];
                    return ListTile(
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration: task.isDone
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      /*leading: Checkbox(
                        value: task.isDone,
                        //onChanged: (val) => _toggleTask(task),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                       // onPressed: () => _deleteTask(task),
                      ), */
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
