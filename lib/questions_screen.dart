import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer)
      onSelectAnswer; //gets the function executed when answer selected from the parent widget as parameter

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(
        selectedAnswer); // widget. gives access to the properties of the widget class and its properties
    setState(() {
      currentQuestionIndex++; // setState triggers the build method to be called again
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, // takes all available space
      child: Container(
        margin: const EdgeInsets.all(40), // margin around the container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // vertical alignment
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // horizontal alignment, it should take all available space
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.779),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textAlign: TextAlign.center, // center the text in the container
            ),
            const SizedBox(height: 20),
            // for (var answer in currentQuestion.answers)
            //   AnswerButton(answer, () {}),
            //   const SizedBox(height: 10),

            // It will return a list of AnswerButton widgets
            // ... is a spread operator that taks a list and pulls all the elements out of it
            ...currentQuestion.getShuffledAnswers().map((answer) => Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // vertical alignment
                  crossAxisAlignment: CrossAxisAlignment
                      .stretch, // horizontal alignment, it should take all available space
                  children: [
                    // calls the AnswerButton widget and passes the answer
                    AnswerButton(
                        answerText:
                            answer, //answer text to be displayed is passed
                        onTap: () {
                          answerQuestion(answer); //
                          const SizedBox(height: 20);
                        }),
                    const SizedBox(height: 10),
                  ],
                ))
            // Generates a list of widgets dynamically mapping a list of answers to a list of AnswerButton widgets
          ],
        ),
      ),
    );
  }
}
