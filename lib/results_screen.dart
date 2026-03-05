import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key,
   required this.chooseAnswers, required List<String> chosenAnswers});

final List<String> chooseAnswers;

List<Map<String,Object >> getSummaryData(){
  List<Map<String, Object>> summary = [];
  for(var i = 0;i<chooseAnswers.length;,i++){
    summary.add({
      'question_index': i,
      'question':questions[i].question,
      'correct_answer': questions[i].answers[0],
    });
  }
  return summary;
}
@override
  Widget build(context)
  {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text('You answered X out of Y questions Correctly'),
            const SizedBox(height:30,),
            QuestionSummary(summaryData:  getSummaryData()),
            const SizedBox(height:30,),
            TextButton(
              onPressed: (){},
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}