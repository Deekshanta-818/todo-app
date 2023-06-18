// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicDisplay extends StatelessWidget {
  const BasicDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'What\'s up, my G!',
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
    const SizedBox(height: 35);
    Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'TODAY\'S TASKS:',
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
              color: Color.fromARGB(255, 139, 211, 245),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
