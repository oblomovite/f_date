import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:path/path.dart';

import 'dart:developer' as developer;

class Questionaire extends StatelessWidget {
  /* Conenct to firebase_database instance */
  // final dbRef = FirebaseDatabase.instance.reference();
  //
  // void readData() {
  //   dbRef.once().then((DataSnapshot snapshot) {
  //     print('Data: ${snapshot.value}');
  //   });
  // }

  static Future<DataSnapshot> getQuestionaires() async =>
      await FirebaseDatabase.instance
          .reference()
          .once()
          .then((DataSnapshot snapshot) {
        return snapshot;
      }).catchError((e) {
        debugPrint(e);
      });

  /* Stream collection from cloud_firestore */
  static Stream<QuerySnapshot> getStream() => FirebaseFirestore.instance

      /// Note this instance knows how to find Firebase because of the
      /// google-services.json/plist in the android/iOS directories
      .collection("questionaire")
      // .where("id", isEqualTo: 1)
      /// returns a stream listening to the given collection
      /// new values are emitted whenever somethings changes
      .snapshots();

  Questionaire();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DataSnapshot>(
      future:
          FirebaseDatabase.instance.reference().child('questionaire').once(),
      builder: (BuildContext context, AsyncSnapshot questions) {
        List<Widget> children;
        if (questions.hasData) {
          final data = questions.data.value;
          // print('questions.data.value: ${questions.data.value.data}');
          print('questions.data.value: $data');

          /*TODO figure out how to decode json string into object*/
          // final List<> question_data = jsonDecode(data.toString());

          // print(question_data);
          children = <Widget>[
            Text(data.toString()),
            // Text(data['questions'])

            // Text(data)
            // Text(data["questions"]),
            // Text(data["questions"][1])
          ];
        } else {
          children = <Widget>[Text("no data found")];
        }
        return ListView(
          children: children,
        );
      },
    );

    /* Stream Query from cloud_firestore*/
    // return StreamBuilder<QuerySnapshot>(
    //     stream: getStream(),
    //     builder: (context, questionaires) {
    //       /* demo - check data */
    //       readData();
    //
    //       if (questionaires.hasError) {
    //         return /*const*/ ErrorWidget(questionaires.error);
    //       }
    //       if (questionaires.hasData) {
    //         final data = questionaires.data;
    //         final test = data.docs;
    //         if (data != null) {
    //           print('Questionaire Loaded');
    //           print('loaded: $getStream');
    //           // developer.log('Questionaire data, $questionaires.data', name: 'my.app.category');
    //
    //           print('shape of questions: $test');
    //           return ListView.builder(
    //             itemExtent: 80.0,
    //             itemCount: data.docs.length,
    //             itemBuilder: (context, index) {
    //               print('data.docs[index] is: $data.docs[index]');
    //               return QuestionaireItem(data.docs[index]);
    //             }, //=>
    //             // QuestionaireItem(data.docs./*[index]*/),
    //             // QuestionaireItem(data.docs[index]),
    //           );
    //         } else {
    //           print('Questionaire not loaded - investigate!');
    //           // developer.log('Questionaire data unavailable', name: 'my.app.category');
    //           return /*const*/ ErrorWidget(questionaires.data);
    //         }
    //       }
    //       return /*const*/ Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     });
  }
}

class QuestionaireItem extends StatelessWidget {
  final QueryDocumentSnapshot _snapshot;
  // final String title;
  // final int id;
  final List<dynamic> questions;

  /*This will be used eventually*/
  // final String questionType;

  QuestionaireItem(this._snapshot)
      : questions = _snapshot.get("questions") as List<dynamic>;

  /// When tapping the icon we want to update the item in teh database so that the "like counter"
  /// increases by 1. We need to reference again the collection via FirebaseFirestore.instance,
  /// increase the value on the correct docu,ent and send the update to Firestore.
  /// It will then take care of notifying listeners about changes.

  /// This approach is secure and free from data races - the scope runTransaction() can be considered
  /// practically atomic

  // void _updateVote() {
  //   FirebaseFirestore.instance.runTransaction((transaction) async {
  //
  //       /// Create a new copy of the document to safely read/write
  //       final secureSnapshot = await transaction.get(
  //         _snapshot.reference
  //       );
  //
  //       // Getting the current lieks ocunt
  //       final int currentLikes = secureSnapshot.get("likes") as int;
  //
  //       /// update() allows you to change the content of the given field.
  //       ///
  //       transaction.update(secureSnapshot.reference, {
  //           "likes": currentLikes + 1
  //       });
  //   });
  // }

  @override

  /// This constitutes a question from the questionaire
  Widget build(BuildContext context) {
    // return ListTile(
    print('shape of questions: $questions');
    return Column(children: [
      // for (var i in questions) Text("questions[i]: $questions[i]")
      for (var i in questions) Text(i.toString())

      // listModel.add(User.fromJson(i));
      // for (var i in questions.values) {
      //   i.asMap().forEach((ind, value) {
      //       print('index=$ind, value=$value');
      //   })
      // }
    ]
        // [],
        // leading: SvgPicture.asset("images/$asset", height:40,),
        // title: Text(question),
        // subtitle: Text("Total likes: $likes"),
        // trailing: IconButton(
        // icon: const Icon(Icons.thumb_up),
        // onPressed: _updateVote,
        // onPressed: () => print('pressed') ,
        // ),
        // );
        );
  }
}
