import 'dart:convert';

import 'package:f_date/api/json_models/questionaire.dart' as Questionaire;
import 'package:f_date/api/json_models/questionaire.dart';
import 'package:f_date/api/json_parsers/json_parser.dart';
// import 'package:f_date/widgets/quiestionaire.dart';
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
  // Future<List<QuestionaireElement>> _getQuestionaires() async { /// 1
  //   /// 1
  //   final db = await FirebaseDatabase.instance
  //       .reference()
  //       .child('questionaires')
  //       .once();
  //   return db.value;
  // }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<List<QuestionaireElement>>( /// 1

    return FutureBuilder<DataSnapshot>(
      future:
          // _getQuestionaires(), /// 1
          FirebaseDatabase.instance.reference().child('myers-briggs').once(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Widget> children;

        final data = snapshot.data.value;
        if (snapshot.hasData && data != null) {
          // print("snapshot.data.value: ${data}");

          final result = data; //[0];
          print("result: ${result}");
          print("result type: ${result.runtimeType}");
          print("result check :: first prompt :: ${result[0]["prompt"]}");
          print("result check :: first response set :: ${result[0]["responses"]}");

          children = <Widget>[
            // for (i in )
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
