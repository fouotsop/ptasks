part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

final class TaskAdded extends TaskEvent {
  final String title;
  final String? description;
  final DateTime? dueDate;

  TaskAdded({required this.title, this.description, this.dueDate});
}

final class TaskUpdated extends TaskEvent {}

final class TaskDeleted extends TaskEvent {}
