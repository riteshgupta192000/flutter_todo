import 'package:hive/hive.dart';
import '../models/task.dart';

class TaskRepository {
  final Box<Task> taskBox = Hive.box<Task>('tasks');

  Future<List<Task>> getTasks() async {
    return taskBox.values.toList();
  }

  Future<void> addTask(Task task) async {
    await taskBox.add(task);
  }

  Future<void> updateTask(Task task) async {
    await task.save();
  }

  Future<void> deleteTask(Task task) async {
    await task.delete();
  }
}
