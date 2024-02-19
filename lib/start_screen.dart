import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  // In that way we can pass a pointer to the switchScreen function that should be accessed
  // We now can call just startQuestions() to execute the function
  // with this.startQuestions we set the function passed to the internal function startQuestions
  const StartScreen({super.key, required this.startQuestions});

  final void Function() startQuestions;

  @override
  Widget build(context) {
    // Center widget takes all space available horizontally and vertically in the parent widget
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // Refers to the vertical size to be the minimum possible
        children: [
          Image.asset('assets/images/quiz-logo.png',
              width: 200, color: const Color.fromARGB(151, 255, 255, 255)),
                        const Padding(padding: EdgeInsets.all(20)),
          Text(
            'Welcome to the Quiz App!',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.779),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(20)),
          ElevatedButton.icon(
            onPressed: startQuestions,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              foregroundColor: const Color.fromARGB(255, 156, 155, 156),
              textStyle: const TextStyle(fontSize: 24),
            ),
            icon: const Icon(Icons.arrow_right_alt_rounded, size: 30),
            label: Text(
              'Take the Quiz',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
