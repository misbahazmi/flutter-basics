import 'package:first_app/quiz/data/questions.dart';
import 'package:first_app/quiz/question_summary/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswer, required this.reStart});

  final List<String> choosenAnswer;
  final void Function() reStart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'choosen_answer': choosenAnswer[i],
        'correct_answer': questions[i].answers[0]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final noOfTotalQuestions = questions.length;
    final noCorrectAnswers = summaryData.where((item) {
      return item['choosen_answer'] == item['correct_answer'];
    }).length;

    return SizedBox(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'You answered $noCorrectAnswers out of $noOfTotalQuestions questions correctly!',
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 230, 200, 253),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              QuestionSummary(resultData: summaryData),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: reStart,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                label: const Text(
                  'Restart',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
