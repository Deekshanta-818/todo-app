import 'package:flutter/material.dart';
import 'widgets/todo_list.dart';
import 'model/todo.dart';
import './widgets/basic_display.dart';
import './widgets/overlay.dart';
import './widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Todo> todos = [
    
  ];

  void addTodo(Todo todo) {
    setState(() {
      todos.add(todo);
    });
  }

  void onDelete(Todo todo) {
    final finalIndex = todos.indexOf(todo);
    setState(() {
      todos.remove(todo);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('todo deleted'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              todos.insert(finalIndex, todo);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 235, 5, 255),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              backgroundColor: const Color(0xFF1C3688),
              context: context,
              builder: (context) => OverlaySheet(
                    addTodos: addTodo,
                    context: context,
                  ));
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromARGB(255, 52, 79, 161),
      appBar: const MyAppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
        child: Column(
          children: [
            const BasicDisplay(),
            const SizedBox(height: 35),
            TodoList(myTodo: todos, onDel: onDelete),
          ],
        ),
      ),
    );
  }
}
