import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/component/question_summary.dart';
import 'package:quiz_app/data/question.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restartQuiz,
      {super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;

  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[1],
        'chosen_answer': chosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numOfQuestion = questions.length;
    final numOfCorrectAnswer = summaryData
        .where((data) => data['chosen_answer'] == data['correct_answer'])
        .length;
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your answer is right $numOfCorrectAnswer out of $numOfQuestion question!",
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(200, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              QuestinoSummary(summaryData),
              const SizedBox(height: 30),
              TextButton.icon(
                style: TextButton.styleFrom(
                  iconColor: Colors.white,
                  foregroundColor: Colors.white,
                ),
                onPressed: restartQuiz,
                icon: const Icon(Icons.refresh),
                label: const Text('Restart quiz!'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
