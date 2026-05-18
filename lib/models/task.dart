class Task {
  final int? id;
  final String title;
  final bool completed;

  Task({this.id, required this.title, this.completed = false});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'completed': completed};
  }
}
