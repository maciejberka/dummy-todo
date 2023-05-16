import 'dart:convert';

import 'package:todoapp/models/task.dart';
import 'package:http/http.dart' as http;

class TodoService {
  static Future<List<Task>> fetchTodos() async {
    final url = Uri.https('dummyjson.com', '/todos');
    final response = await http.get(url);
    final json = jsonDecode(response.body);

    List<Task> allTasks = [];
    var listOfTodos = json['todos'] as List;

    for (var item in listOfTodos) {
      allTasks.add(Task.fromJson(item));
    }
    return allTasks;
  }
}
