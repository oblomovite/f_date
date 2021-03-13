import 'package:flutter/material.dart';

class QuestionPrompt extends StatelessWidget {
  final String prompt;
  const QuestionPrompt(
    this.prompt,
  );

  @override
  Widget build(BuildContext context) {
    /* Make this fade-in? */
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            prompt,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
