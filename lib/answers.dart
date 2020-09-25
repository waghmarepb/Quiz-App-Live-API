import 'package:demo_api/widget/checkbox.dart';
import 'package:demo_api/widget/radio.dart';
import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String optionText;
  final String type;
  final int index;
  final Function checkAnswer;
  Answers(this.optionText, this.type, this.index, this.checkAnswer);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        // margin: EdgeInsets.all(10),
        child: Row(children: <Widget>[
          type == 'Multiple-Response'
              ? CheckBoxWidget(index, optionText, checkAnswer)
              : RadioWidget(index, optionText, checkAnswer),
          Divider(
            color: Colors.red,
            thickness: 20,
          ),
        ]));
  }
}
