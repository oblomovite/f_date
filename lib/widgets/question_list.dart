import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';

/*
This widget contains the UI for a given questionaire -- 

Once a questionaire from the QuestionaireList has been selected this 
widget will appear

*/

class QuestionPrompt extends StatelessWidget {
  final String prompt;
  final List<dynamic> responses;
  const QuestionPrompt({this.prompt, this.responses});

  // QuestionPrompt.fromMap(Map<String, dynamic> data) {
  //   this.responses = data['responses'];
  // }

  @override
  Widget build(BuildContext context) {
    /* Make this fade-in? */
    return Container(
      child: Column(children: <Widget>[
        Row(children: [
          Text(
            prompt,
            textAlign: TextAlign.center,
          ),
        ]),
        for (var i in responses) Text(
                i.toString(),
                textAlign: TextAlign.center,
        )
      ]),
    );
  }
}

class QuestionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DataSnapshot>(
      future:
          FirebaseDatabase.instance.reference().child('myers-briggs').once(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Widget> children;

        final data = snapshot.data.value;
        if (snapshot.hasData && data != null) {
          final result = data; //[0];
          print("result: ${result}");
          print("result type: ${result.runtimeType}");
          print(
              "result check :: first prompt :: ${result[0]["prompt"].runtimeType}");
          print(
              "result check :: first response set :: ${result[0]["responses"].runtimeType}");

          // List<String> example_responses = result[0]["responses"];
          children = <Widget>[
            Text('example text'),
            // QuestionPrompt()
            QuestionPrompt(
              prompt: result[0]["prompt"],
              responses: result[0]["responses"] //.cast<List<String>>()
              ,
            )
            // getQuestions(result),
          ];
        } else {
          children = <Widget>[Text("no data found")];
        }
        return ListView(
          children: children,
        );
      },
    );
  }
}
