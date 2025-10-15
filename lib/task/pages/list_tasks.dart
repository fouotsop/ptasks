import 'package:flutter/material.dart';
import 'package:ptasks_repository/ptasks_repository.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key, required this.taskService});
  final TaskService taskService;

  @override
  State<StatefulWidget> createState() {
    return _TaskPageState();
  }
}

class _TaskPageState extends State<TaskPage> {
  final TextEditingController _controller = TextEditingController();
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() async {
    final data = await widget.taskService.getTasks();
    setState(() {
      tasks = data;
    });
  }

  void _addTask() async {
    if (_controller.text.isNotEmpty) {
      Task t1 = Task(title: _controller.text);
      Map<String, dynamic> taskMap = t1.toMap();
      await widget.taskService.insertTask(taskMap);
      _controller.clear();
      _loadTasks();
    }
  }

  void _toggleTask(Task task) async {
    await widget.taskService.updateTask(task.id!, {
      'title': task.title,
      'isDone': task.isDone ? 0 : 1,
    });
    _loadTasks();
  }

  void _deleteTask(Task task) async {
    await widget.taskService.deleteTask(task.id!);
    _loadTasks();
  }

  @override
  void dispose() {
    widget.taskService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQLite Task Manager")),
      body: Column(
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
                IconButton(icon: Icon(Icons.add), onPressed: _addTask),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isDone
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: task.isDone,
                    onChanged: (val) => _toggleTask(task),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(task),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
