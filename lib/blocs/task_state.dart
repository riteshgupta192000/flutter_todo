import '../models/task.dart';

abstract class TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;

  TaskLoaded({required this.pendingTasks, required this.completedTasks});
}

class TaskError extends TaskState {
  final String message;

  TaskError(this.message);
}
