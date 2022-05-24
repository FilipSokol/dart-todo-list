import 'package:flutter/cupertino.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  String priority;

  Todo({
    @required this.createdTime,
    @required this.title,
    @required this.priority,
    this.description = '',
    this.id,
  });
}
