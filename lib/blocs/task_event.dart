import '../models/task.dart';


abstract class TaskEvent {}

class LoadTasksEvent extends TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final Task task;
  AddTaskEvent(this.task);
}

class MarkTaskCompletedEvent extends TaskEvent {
  final Task task;
  MarkTaskCompletedEvent(this.task);
}

class DeleteTaskEvent extends TaskEvent {
  final Task task;
  DeleteTaskEvent(this.task);
}














// import '../models/task.dart';

// abstract class TaskEvent {}

// class LoadTasksEvent extends TaskEvent {
  
// }

// class AddTaskEvent extends TaskEvent {
//   final Task task;
//   AddTaskEvent(this.task);
// }

// class UpdateTaskEvent extends TaskEvent {
//   final Task task;
//   UpdateTaskEvent(this.task);
// }

// class DeleteTaskEvent extends TaskEvent {
//   final Task task;
//   DeleteTaskEvent(this.task);
// }
