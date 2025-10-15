class Task {
  final int? id;
  final String title;
  final String? description;
  final bool isDone;
  final DateTime? dueDate;

  Task({
    this.id,
    required this.title,
    this.description,
    this.isDone = false,
    this.dueDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone ? 1 : 0,
      'description': description,
      'dueDate': dueDate?.toIso8601String(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isDone: map['isDone'] == 1,
      dueDate: map['dueDate'] != null ? DateTime.parse(map['dueDate']) : null,
    );
  }
}
