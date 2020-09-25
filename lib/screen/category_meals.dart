import 'dart:collection';

import 'package:flutter/material.dart';

import '../quiz.dart';
import '../result.dart';

class CotegoryMeals extends StatefulWidget {
  @override
  _CotegoryMealsState createState() => _CotegoryMealsState();
}

class _CotegoryMealsState extends State<CotegoryMeals> {
  var _resultScore = 0;
  int _questionIndex = 0;
  var _questionBank;
  List<int> answerList = [];
  void _answerChoosen(index) {
    if (_questionBank[_questionIndex]['type'] == 'Multiple-Response') {
      if (index.length == _questionBank['correctOptionIndex'].length) {
        var count = 0;
        for (var i = 0; i < index.length; i++) {
          for (var j = 0; j < _questionBank['correctOptionIndex'].length; j++) {
            if (index[i] == _questionBank['correctOptionIndex'][j]) {
              count += 1;
            }
          }
        }
        if (count == _questionBank['correctOptionIndex'].length) {
          _resultScore += 1;
        }
      }
    } else {
      if (index == _questionBank['correctOptionIndex']) {
        _resultScore += 1;
      }
    }
  }

  void nextQuestion(answers) {
    print(answers);
    setState(() {
      _questionIndex += 1;
    });
    _answerChoosen(answers);
  }

  void checkAnswer(int index) {
    setState(() {
      answerList.add(index);
    });
  }

  void previousQuestion() {
    setState(() {
      _questionIndex -= 1;
    });
  }

  void _resetQuiz(BuildContext context) {
    Navigator.of(context).pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    LinkedHashMap<String, dynamic> test = routeArgs['tests'];
    final String title = routeArgs['title'];
    // variables for test to begin
    this._questionBank = test['questions'];

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: _questionIndex < _questionBank.length
          ? Quiz(
              questionBank: _questionBank,
              questionIndex: _questionIndex,
              checkAnswer: checkAnswer,
              answerList: answerList,
              nextQuestion: nextQuestion,
              previousQuestion: previousQuestion,
            )
          : Result(_resultScore, _resetQuiz),
    );
  }
}
