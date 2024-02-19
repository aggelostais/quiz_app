import "package:flutter/material.dart";

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return Column(
        children: summaryData.map((data) {
      //getting one map from the list at a time
      return Row(
        children: [
          Text(((data['question_index'] as int) + 1)
              .toString()), //typecasting to int, informing dart of the type. It is used in map
          Expanded(
            //text that is too long will be wrapped to the next line
            // If we  expanded inside a row, its child widget (column) cannot take more space than the row
            child: Column(
              //takes infinite width even beyond the screen
              children: [
                Text(data['question']
                    as String), //typecasting to string, informing dart of the type.
                const SizedBox(height: 5),
                Text('Correct Answer: ${data['correct_answer']}'),
                const SizedBox(height: 5),
                Text('Your Answer: ${data['user_answer']}'),
              ],
            ),
          ),
        ],
      );
    }).toList()); // toList() is used to convert the iterable object to a list
  }
}
