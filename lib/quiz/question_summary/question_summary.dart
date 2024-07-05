import 'package:first_app/quiz/question_summary/question_item.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.resultData});

  final List<Map<String, Object>> resultData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: resultData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
    ;
  }
}
