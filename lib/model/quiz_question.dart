class QuizQuestion{
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> get shuffleAnswerList{
    final List<String> shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}