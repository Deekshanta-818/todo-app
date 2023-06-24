import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/todo.dart';

class OverlaySheet extends StatelessWidget {
  OverlaySheet({required this.addTodos, required this.context, Key? key})
      : super(key: key);

  final void Function(Todo todo) addTodos;
  final TextEditingController titleController = TextEditingController();
  final BuildContext context;

  void submitData() {
    addTodos(Todo(title: titleController.text));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Wrap with SingleChildScrollView
      child: Padding(
        padding:  EdgeInsets.only(top: 20, left: 20, right:20, bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add a Todo',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: titleController,
              maxLength: 50,
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 155, 171, 218),
                ),
                counterStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: submitData,
                  child: const Text('Save Todo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
