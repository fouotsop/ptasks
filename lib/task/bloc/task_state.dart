part of 'task_bloc.dart';

@immutable
class TaskState extends Equatable {
  final int? id;
  final String title;
  final String? description;
  final DateTime? dueDate;

  final List<Task> tasks;

  const TaskState({
    this.id,
    required this.title,
    this.description,
    this.dueDate,
    required this.tasks,
  });

  const TaskState.initial()
    : id = null,
      title = '',
      description = null,
      dueDate = null,
      tasks = const [];

  TaskState copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? dueDate,
    List<Task>? tasks,
  }) {
    return TaskState(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props => [id, title, description, dueDate, tasks];
}
