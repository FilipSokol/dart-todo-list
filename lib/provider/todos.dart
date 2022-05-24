import 'package:flutter/cupertino.dart';
import 'package:todo_app_ui_ii_example/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'TEST 1',
      description: '''OPIS''',
      priority: '1',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'TEST 2',
      description: '''OPIS''',
      priority: '2',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'TEST 3',
      description: '''OPIS''',
      priority: '3',
    ),
  ];

  List<Todo> get todos => _todos.toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  void updateTodo(Todo todo, String title, String description, String priority) {
    todo.title = title;
    todo.description = description;
    todo.priority = priority;

    notifyListeners();
  }
}
