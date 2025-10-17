import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ptasks_repository/ptasks_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskService taskService;

  TaskBloc({required this.taskService}) : super(TaskState.initial()) {
    on<TaskAdded>((event, emit) => onTaskAdded(event, emit));
  }

  onTaskAdded(TaskAdded event, Emitter<TaskState> emit) async {
    final task = Task(
      title: event.title,
      description: event.description,
      dueDate: event.dueDate,
    );
    final id = await taskService.insertTask(task.toMap());
    List<Task> currentTasks = await taskService.getTasks();

    emit(
      state.copyWith(
        id: id,
        title: event.title,
        description: event.description,
        dueDate: event.dueDate,
        tasks: currentTasks,
      ),
    );
  }
}
