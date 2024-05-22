import 'package:flutter/material.dart';
import 'package:quiz_app/component/answer_button.dart';
import 'package:quiz_app/data/question.dart';
import 'package:google_fonts/google_fonts.dart';
class QuestionScreen extends StatefulWidget {
  QuestionScreen({super.key, required this.onSelectedAnswer});
  void Function(String answerContent) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void nextQuestion(String selectedAnswer){
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.jacquardaBastarda9(
                color: const Color.fromARGB(255, 237, 207, 207),
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.shuffleAnswerList.map((answer) {
              return AnswerButton(answer, (){ nextQuestion(answer);});
            }),
          ],
        ),
      ),
    );
  }
}
