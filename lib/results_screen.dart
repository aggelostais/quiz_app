import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

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
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) { //creates a new filtered list
      return data['correct_answer'] == data['user_answer'];
    }).length;


    return SizedBox(
      width: double.infinity, // takes all available space
      child: Container(
        margin: const EdgeInsets.all(40), // margin around the container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // vertical alignment
          children: [
            Text('You have answered $numCorrectAnswers out of $numTotalQuestions questions correctly!'),
            QuestionsSummary(summaryData: summaryData), //we are not passing the function to be executed but the return result of the function
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
