import 'package:first_app/quiz/data/questions.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({super.key});

  final questionData = questions[0];

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.questionData.answers[0]),
    );
  }
}
