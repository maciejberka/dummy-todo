class Task {
  Task({required this.id, required this.name, required this.completed});
  final int id;
  final String name;
  final bool completed;

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(id: json['id'], name: json['todo'], completed: json['completed']);
  }
}
