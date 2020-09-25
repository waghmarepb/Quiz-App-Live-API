import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final String title;
  final value;
  final Function checkAnswer;
  CheckBoxWidget(
    this.value,
    this.title,
    this.checkAnswer,
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: false,
            onChanged: null,
            activeColor: Theme.of(context).primaryColor,
          ),
          Text(title),
        ],
      ),
      onTap: () {
        print(title);
        checkAnswer(value);
      },
    );
  }
}
