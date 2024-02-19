// We store the first answer in the list of answers as the correct answer
// to not store a redundant values
class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  // We add a method to the class to return a shuffled list of answers without changing the original list
  List <String> getShuffledAnswers() {
    final shuffledAnswers =List.of(answers); // final cause it cannot be reassigned, but the existing elements can be edited
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
