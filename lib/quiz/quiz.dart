import 'package:first_app/quiz/data/questions.dart';
import 'package:first_app/quiz/question_screen.dart';
import 'package:first_app/quiz/result_screen.dart';
import 'package:first_app/quiz/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({
    super.key,
  });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> answerList = [];

  var activeScreen = 'start-screen';

  void startQuizScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void chooseAnswer(String answer) {
    answerList.add(answer);
    if (answerList.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuestion() {
    answerList = [];
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(
      startQuizScreen: startQuizScreen,
    );

    if (activeScreen == 'question-screen') {
      // question is being assinged in screenWidget
      screenWidget = QuestionScreen(
        chooseAnser: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      //result is being assigned in screenWidget
      screenWidget = ResultScreen(
        choosenAnswer: answerList,
        reStart: restartQuestion,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: true,
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
