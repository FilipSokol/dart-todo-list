import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final String priority;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedPriority;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key key,
    this.title = '',
    this.description = '',
    this.priority = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onChangedPriority,
    @required this.onSavedTodo,
  }) : super(key: key);

  static final RegExp letterRegExp = RegExp('[a-zA-Z]');

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(height: 8),
            buildPriority(),
            SizedBox(height: 8),
            buildDescription(),
            SizedBox(height: 16),
            buildButton(),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'Tytuł nie może być pusty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Tytuł Zadania',
        ),
      );

  Widget buildPriority() => TextFormField(
    maxLines: 1,
    initialValue: priority,
    onChanged: onChangedPriority,
    validator: (priority) {
      if (priority.isEmpty) {
        return 'Priorytet nie może być pusty';
      }
      if (letterRegExp.hasMatch(priority)) {
        return 'Priorytet może być tylko liczbą';
      }
      // ZASTOSOWAŁEM TAKI DZIWNY ZAPIS ZAMIAST && BO DART COŚ NIE OGARNIA W TYM PRZYPADKU I WYPISUJE W ZŁYCH ZAKRESACH
      if (1 > int.parse(priority)) {
        return 'Priorytet może być pomiędzy 1-3';
      }
      if (int.parse(priority) > 3) {
        return 'Priorytet może być pomiędzy 1-3';
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Priorytet',
    ),
  );

  Widget buildDescription() => TextFormField(
        maxLines: 3,
        initialValue: description,
        onChanged: onChangedDescription,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Opis Zadania',
        ),
      );


  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.cyan),
          ),
          onPressed: onSavedTodo,
          child: Text('Zapisz'),
        ),
      );
}
