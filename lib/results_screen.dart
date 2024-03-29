import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Text('You have answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.779),
                    fontSize: 24,
                  ),
                ),
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            QuestionsSummary(summaryData: summaryData), //we are not passing the function to be executed but the return result of the function
            const SizedBox(height: 20),
            ElevatedButton.icon(
            onPressed: restartQuiz,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(15),
              foregroundColor: const Color.fromARGB(255, 156, 155, 156),
            ),
            icon: const Icon(Icons.restart_alt_rounded, size: 30),
            label: Text(
              'Restart Quiz!',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 24,
                ),
            ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
