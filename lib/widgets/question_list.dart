import 'package:f_date/api/json_models/questionaire.dart' as Questionaire;
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
          FirebaseDatabase.instance
              .reference()
              .child('questionaires')

              /// get the first questionaire
              .child('0')
              .once(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Widget> children;

        final data = snapshot.data.value;
        if (snapshot.hasData && data != null) {
          // print("snapshot.data.value: ${data}");

          final result = data;
          print("result: ${result}");
          print("result type: ${result.runtimeType}");

          var questions = Questionaire.QuestionaireElement.fromJson(data);
          print(questions);
          // print("result length: ${result.length}");
          // print("result :: first item title :: ${result[0]["title"]}");
          // print("result :: first item questions :: ${result[0]["questions"]}");

          // final myersBriggs = Questionaire.QuestionaireElement(
          //     title: result[0]["title"], questions: result[0]["questions"]);

          // var x = snapshot.data.value[0]["questions"];
          // .forEach((value, index) {
          // print(value);
          // print("value: $value");
          // print("key: ${result[index][index]}");
          // });

          /// List of Questions
          // print("x is $x");
          //
          // /// Individial Question and Responses Object
          // print("x[0]: ${x[0]}");
          //
          // print("x[0][prompt]: ${x[0]["prompt"]}");
          // print("x[0][responses]: ${x[0]["responses"]}");
          //
          // print("keys from x[0]: ${x[0].keys}");
          // print("values from x[0]: ${x[0].values}");

          // print("myers-briggs type: ${myersBriggs.runtimeType}");
          // print("myers-briggs: ${myersBriggs}");

          // result.forEach((value) {
          //   print("value: $value");
          // });

          /// Okay so I have to convert it myself from a List<dynamic>
          // List<Questionaire.QuestionaireElement> questions =
          //     result.map((value) {
          //   Questionaire.QuestionaireElement.fromJson(value);
          // });

          /// Check result
          // print("CONVERSION ATTEMPT: $questions");
          // print("CONVERSION ATTEMPT CHECK TYPE: ${questions.runtimeType}");

          // final result = questions.data.value;
          // questions.data.value.forEach(
          // (index, data) {

          // final result = QuestionaireParser()
          // .parseFromJson(snapshot.data.value
          //   //
          //   .toString()
          // );
          //
          // print("questionaire: $result");

// .then(function(snapshot) {
//     snapshot.forEach(function(childSnapshot) {
//       var key = childSnapshot.key; // you will get your key here
//   });
// });

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
