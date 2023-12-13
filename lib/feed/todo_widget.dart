import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  final Map<String, dynamic> todo;
  final Function(Map<String, dynamic>) onToDoChanged;
  final Function(String) onDeleteItem;

  ToDoItem({
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo['todoText']),
      leading: Checkbox(
        value: todo['isDone'],
        onChanged: (value) {
          todo['isDone'] = value;
          onToDoChanged(todo);
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          onDeleteItem(todo['id']);
        },
      ),
    );
  }
}
