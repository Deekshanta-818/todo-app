import 'package:flutter/material.dart';
import '../model/todo.dart';
import 'new_todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({required this.onDel ,required this.myTodo, super.key});
  final List<Todo> myTodo;
  final void Function(Todo todo) onDel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return NewTodo(text: myTodo[index].title, 
          onSwipe: () => onDel(myTodo[index]),
          );
        },
        itemCount: myTodo.length,
      ),
    );
  }
}
