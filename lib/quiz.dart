import 'package:flutter/material.dart';

import './question.dart';
import './answers.dart';

class Quiz extends StatelessWidget {
  final questionBank;
  final int questionIndex;
  final Function checkAnswer;
  final Function nextQuestion;
  final Function previousQuestion;
  final List answerList;
  Quiz({
    @required this.questionBank,
    @required this.questionIndex,
    @required this.checkAnswer,
    @required this.answerList,
    @required this.nextQuestion,
    @required this.previousQuestion,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionBank[questionIndex]['questionText']),
        ...(questionBank[questionIndex]['options'] as List).map((option) {
          final index =
              (questionBank[questionIndex]['options'] as List).indexOf(option);
          return Answers(
              option, questionBank[questionIndex]['type'], index, checkAnswer);
        }).toList(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // if (questionIndex > 0)
            //   IconButton(
            //     icon: Icon(
            //       Icons.arrow_back,
            //     ),
            //     color: Colors.red,
            //     tooltip: 'Previous question',
            //     onPressed: previousQuestion,
            //   ),
            if (questionIndex < questionBank.length)
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                ),
                tooltip: 'Next question',
                color: Colors.red,
                onPressed: () => nextQuestion(answerList),
              ),
          ],
        ),
      ],
    );
  }
}
