import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  // In that way we can pass a pointer to the switchScreen function that should be accessed
  // We now can call just startQuiz() to execute the function
  // with this.startQuiz we set the function passed to the internal function startQuiz
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    // Center widget takes all space available horizontally and vertically in the parent widget
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // Refers to the vertical size to be the minimum possible
        children: [
          const Text(
            'Welcome to the Quiz App!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          const Padding(padding: EdgeInsets.all(15)),
          Image.asset('assets/images/quiz-logo.png',
              width: 200, color: const Color.fromARGB(151, 255, 255, 255)),
          const Padding(padding: EdgeInsets.all(30)),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              foregroundColor: const Color.fromARGB(255, 156, 155, 156),
              textStyle: const TextStyle(fontSize: 24),
            ),
            icon: const Icon(Icons.arrow_right_alt_rounded, size: 30),
            label: const Text('Take the Quiz'),
          ),
        ],
      ),
    );
  }
}
