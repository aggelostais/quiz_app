import "package:flutter/material.dart";

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        //Makes each child scrollable
        child: Column(
            children: summaryData.map((data) {
          //getting one map from the list at a time
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start, //vertical alignment
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: data['correct_answer'] == data['user_answer'] ? Colors.green.shade300 : Colors.red.shade300,
                ),
                child: Center(
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10), //SizedBox is a widget that takes up space without drawing anything
              Expanded(
                //text that is too long will be wrapped to the next line
                // If we  expanded inside a row, its child widget (column) cannot take more space than the row
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //takes infinite width even beyond the screen
                  children: [
                    Text(data['question']
                        as String, style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                        ), //typecasting to string, informing dart of the type.
                    Text('${data['user_answer']}',
                        style: const TextStyle(
                    color: Color.fromARGB(127, 0, 0, 0),
                        ),),
                    Text('${data['correct_answer']}',
                        style: TextStyle(
                    color: Colors.green.shade300))
                  ],
                ),
              ),
            ],
          );
        }).toList()),
      ),
    ); // toList() is used to convert the iterable object to a list
  }
}
