import 'package:ptasks_repository/model/model.dart';
import 'package:ptasks_repository/service/database.dart';

class TaskService {
  DatabaseService service = DatabaseService();

  Future<int> insertTask(Map<String, dynamic> task) async {
    final db = await service.database;
    return await db.insert('tasks', task);
  }

  Future<List<Task>> getTasks() async {
    final db = await service.database;
    List<Map<String, dynamic>> results = await db.query('tasks');

    List<Task> tasks = results.isNotEmpty
        ? results.map((map) => Task.fromMap(map)).toList()
        : [];
    return tasks;
  }

  Future<int> updateTask(int id, Map<String, dynamic> task) async {
    final db = await service.database;
    return await db.update('tasks', task, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteTask(int id) async {
    final db = await service.database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> close() async {
    await service.closeDB();
  }
}
