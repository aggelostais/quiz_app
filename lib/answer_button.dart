import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.selectHandler, {super.key});

  final String answerText;
  final void Function() selectHandler;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: selectHandler,
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 156, 155, 156),
        textStyle: const TextStyle(fontSize: 24),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(40),
        // ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
