import 'package:app_2/data/questions.dart';
import 'package:app_2/question_screen.dart';
import 'package:app_2/result_screen.dart';
import 'package:flutter/material.dart';
import "package:app_2/start_screen.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void restartQuiz() {
    selectedAnswers.clear();
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "question-screen") {
      screenWidget = QuestionScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }
    if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
