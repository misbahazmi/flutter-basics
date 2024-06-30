import 'package:first_app/quiz/question_screen.dart';
import 'package:first_app/quiz/start_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({
    super.key,
  });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var _activeScreen = 'start-screen';

  void startQuizScreen() {
    setState(() {
      _activeScreen = "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(
      startQuizScreen: startQuizScreen,
    );

    if (_activeScreen == 'question-screen') {
      // question is being assinged in screenWidget
      screenWidget = QuestionScreen();
    }

    if (_activeScreen == 'result-screen') {
      //result is being assigned in screenWidget
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
