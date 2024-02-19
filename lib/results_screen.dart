import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.restartQuiz});
  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  // Map: collection of key-value pairs specifying the type of the key and the type of the value
  // Object is a flexible type that can be used to store any type of data
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {

      // add a map to the list by using {} and adding the key-value pairs
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity, // takes all available space
      child: Container(
        margin: const EdgeInsets.all(40), // margin around the container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // vertical alignment
          children: [
            const Text(
              'Results',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            for (var result in chosenAnswers) Text(result),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                restartQuiz();
              },
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
