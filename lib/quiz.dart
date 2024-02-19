import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

// the button that should trigger the state change is in one widget and the widget that should be affected
// by the state change is another widget.

class Quiz extends StatefulWidget {
  // Parent widget of the StartScreen and QuestionsScreen
  const Quiz({super.key});

  @override
  State<Quiz> createState() =>
      _QuizState(); // createState creates the state for the widget based on QuizState
}

class _QuizState extends State<Quiz> {
  // We start with the StartScreen, widgets can be stored in variables
  // Widget to not restrict the variable to the type of StartScreen widget
  // switchScreen() would execute this function
  // Passes a pointer to the function that should be executed
  // Inside startScreen we can call this function
  // Widget activeScreen = const StartScreen(switchScreen);

  // InitState is for initializations when the objecte is first created
  // and never executed again

  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  // Widget? activeScreen; // alternative way
  // alternative way, init state should be called
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState(); // initialization performed in the parent class
  // }

  // This method should be connected to the button in the StartScreen
  // The StartScreen that will initiate the state change should have access to the state change method
  void switchScreen() {
    setState(() {
      if (activeScreen == 'start-screen') {
        activeScreen = 'questions-screen';
      } else {
        activeScreen = 'start-screen';
        selectedAnswers = [];
      }
      // activeScreen = const QuestionsScreen();
    });
  }

// Adds the selected answer to the list
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(startQuestions: switchScreen);
    // When activeScreen is 'questions-screen' is changed in setState it will be triggered
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer:
            chooseAnswer, //gives the function that should be executed when answer is selected
      );
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
          chosenAnswers: selectedAnswers, restartQuiz: switchScreen);
    }

    // ternary-expression: condition ? true : false
    // final screenWidget = activeScreen == 'start-screen'
    //       ? StartScreen(switchScreen)
    //       : const QuestionsScreen();

    return MaterialApp(
      home: Scaffold(
        body: Container(
          //We wrap it in container here to apply the same gradient to all screens
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade900,
                Colors.blueGrey.shade400,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
          //activeScreen, //alternative way, we pass a pointer at that function using the function name as a value
        ),
      ),
    );
  }
}
