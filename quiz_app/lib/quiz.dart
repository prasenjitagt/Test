import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/starting_screeen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'starting-screen';

  void setScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'starting-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget currentScreen = StartingScreen(setScreen);

    if (activeScreen == 'questions-screen') {
      currentScreen = QuestionsScreen(onChooseAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      currentScreen = ResultScreen(
        choosenAnswers: selectedAnswers,
        reStartQuizFunc: restartQuiz,
      );
    }
    if (activeScreen == 'starting-screen') {
      selectedAnswers = [];
      currentScreen = StartingScreen(setScreen);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 69, 4, 90),
                Color.fromARGB(255, 146, 18, 185),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: currentScreen)),
    );
  }
}
