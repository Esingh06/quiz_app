import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        final isCorrect = data['user_answer'] == data['correct_answer'];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ((data['question_index'] as int) + 1).toString(),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['question'] as String,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data['user_answer'] as String,
                    style: TextStyle(
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                  ),
                  Text(
                    data['correct_answer'] as String,
                    style: const TextStyle(color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}