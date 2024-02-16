

class QuizQuestions {
    const QuizQuestions({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
  
  final String question;
  final List<String> answers;
  final int correctAnswer;
}