import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {
  final String title;
  final value;
  final Function checkAnswer;
  RadioWidget(
    this.value,
    this.title,
    this.checkAnswer,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: <Widget>[
          Radio(
            groupValue: title,
            value: value,
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
