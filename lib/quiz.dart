import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';


// the button that should trigger the state change
// is in one widget and the widget that should be affected
// by the state change is another widget.

// Parent widget of the StartScreen and QuestionsScreen
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState(); // createState creates the state for the widget based on QuizState
}

// This class is closely connected with the Quiz class
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
      activeScreen = 'questions-screen';
      // activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    Widget screenWidget = StartScreen(switchScreen);
    // When activeScreen is 'questions-screen' is changed in setState it will be triggered
    if (activeScreen == 'questions-screen') {
      screenWidget = const QuestionsScreen();
    }

    // ternary-expression: condition ? true : false
    // final screenWidget = activeScreen == 'start-screen' 
    //       ? StartScreen(switchScreen) 
    //       : const QuestionsScreen();


    return MaterialApp(
      home: Scaffold(
        //We wrap it in container here to apply the same gradient to all screens
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 110, 59, 96),
                Color.fromARGB(255, 179, 148, 170)
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
