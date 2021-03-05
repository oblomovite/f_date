import 'package:f_date/api/json_models/questionaire.dart';
// import 'package:f_date/api/json_parsers/json_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';

/*
This widget contains the UI for a given questionaire -- 

Once a questionaire from the QuestionaireList has been selected this 
widget will appear

*/

class QuestionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DataSnapshot>(
      future:
          // FirebaseDatabase.instance.reference().child('questionaire').once(),
          FirebaseDatabase.instance.reference().child('questionaires').once(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Widget> children;
        if (snapshot.hasData && snapshot.data.value != null) {
          // final result = questions.data.value;
          // questions.data.value.forEach(
          // (index, data) {

          // print(snapshot.data.value["questions"]);
          // List<dynamic> questions = snapshot.data.value;

          // final questionaire = questionaireFromJson(jsonString);
          // final Questionaire questionaire =
          // Questionaire.fromJson(snapshot.data.value[0]);

          final questionaire =
              Questionaire.fromJson(snapshot.data.value);

          print("questionaire: $questionaire");

          children = <Widget>[
            Text('example text'),
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
