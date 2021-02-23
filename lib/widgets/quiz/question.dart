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
  final Function selectHandler;
  final dynamic questionContent;
  final List<String> responseContent;

  Question({
      this.selectHandler,
      this.questionContent,
      this.responseContent,
  });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child:  ,
    );
  }
}
