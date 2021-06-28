import 'package:flutter/widgets.dart';

/// Widget that displays Questions and Responses

/*
TODO:
build a ui for a question
write logic to advance one question forward when a reply is submitted 
write logic to terminate a quiz once all questions are answered
wrtte logic to animate transitions between questions
write logic to get quiz content (JSON) from Firebase
*/

class Question extends StatelessWidget {
  late final Function selectHandler;
  late final dynamic questionContent;
  late final List<String> responseContent;

  Question({
      required this.selectHandler,
      this.questionContent,
      required this.responseContent,
  });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}
