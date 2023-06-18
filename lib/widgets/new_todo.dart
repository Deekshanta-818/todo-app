import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({required this.text, required this.onSwipe, Key? key})
      : super(key: key);
  final VoidCallback onSwipe;

  final String text;

  @override
  // ignore: library_private_types_in_public_api
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  bool isChecked = false;
  double opacity = 1.0;

  void dismissCard() {
    setState(() {
      opacity = 0.0;
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      // Remove the card from the widget tree after the animation finishes
      setState(() {
        widget.onSwipe();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 500),
      child: Card(
        color: const Color(0xFF031956),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                    dismissCard();
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isChecked
                        ? const Color(0xFF1C3688)
                        : Colors.transparent,
                    border:
                        Border.all(color: const Color(0xFF1C3688), width: 2.5),
                  ),
                  child: isChecked
                      ? const Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.text,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 155, 171, 218),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                DateFormat('h:mm a').format(DateTime.now()),
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 155, 171, 218),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
