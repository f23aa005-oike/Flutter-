class Todo {
  String id;
  String title;
  bool isCompleted;
  DateTime dueDate;

  Todo({
    required this.title,
    required this.dueDate,
    this.isCompleted = false,
  }) : id = DateTime.now().millisecondsSinceEpoch.toString();

  Todo copyWith({
    String? title,
    bool? isCompleted,
    DateTime? dueDate,
  }) {
    return Todo(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
    );
  }
} 