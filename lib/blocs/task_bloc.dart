import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_event.dart';
import 'task_state.dart';
import '../models/task.dart';
import '../repositories/task_repository.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository;

  TaskBloc(this.repository) : super(TaskLoading()) {
    on<LoadTasksEvent>((event, emit) async {
      emit(TaskLoading());
      try {
        final tasks = await repository.getTasks();
        emit(TaskLoaded(
          pendingTasks: tasks.where((task) => !task.isCompleted).toList(),
          completedTasks: tasks.where((task) => task.isCompleted).toList(),
        ));
      } catch (e) {
        emit(TaskError("Failed to load tasks: ${e.toString()}"));
      }
    });

    on<AddTaskEvent>((event, emit) async {
      try {
        await repository.addTask(event.task);
        add(LoadTasksEvent());
      } catch (e) {
        emit(TaskError("Failed to add task: ${e.toString()}"));
      }
    });

    on<MarkTaskCompletedEvent>((event, emit) async {
      try {
        await repository.updateTask(event.task.copyWith(isCompleted: true));
        add(LoadTasksEvent());
      } catch (e) {
        emit(TaskError("Failed to mark task as completed: ${e.toString()}"));
      }
    });

    on<DeleteTaskEvent>((event, emit) async {
      try {
        await repository.deleteTask(event.task);
        add(LoadTasksEvent());
      } catch (e) {
        emit(TaskError("Failed to delete task: ${e.toString()}"));
      }
    });
  }
}
