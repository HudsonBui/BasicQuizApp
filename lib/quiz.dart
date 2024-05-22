import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";
  List<String> answeredQuestion = [];

  void changeScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void selectAnswer(String answer) {
    answeredQuestion.add(answer);

    if(answeredQuestion.length == questions.length){
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz(){
    answeredQuestion = [];
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(changeScreen);
    if(activeScreen == 'question-screen'){
      screenWidget = QuestionScreen(onSelectedAnswer: selectAnswer);
    }if(activeScreen == 'results-screen'){
      screenWidget = ResultsScreen(restartQuiz, chosenAnswer: answeredQuestion,);
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.purple.shade800,
            Colors.purple.shade400,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: screenWidget,
      ),
    );
  }
}
