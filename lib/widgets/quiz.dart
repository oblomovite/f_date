
/*
This widget contains the UI for a given questionaire -- 

Once a questionaire from the QuestionaireList has been selected this 
widget will appear

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class Questionaire extends StatelessWidget {

  static Stream<QuerySnapshot> getStream() =>
  FirebaseFirestore
  .instance
  .collection("questionaires")
  .where("id", isEqualTo: 1)
  /// returns a stream listening to the given collection
  /// new values are emitted whenever somethings changes
  .snapshots();

  const Questionaire();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getStream(),
      builder: (context, questionaires) {
        if (questionaires.hasError) {
          return /*const*/ ErrorWidget(questionaires.error!);
        }

        if (questionaires.hasData) {
          final data = questionaires.data;
          if (data != null ) {
            return ListView.builder(
              itemExtent: 80.0,
              itemCount: data.docs.length,
              itemBuilder: (context, index) =>
              // QuestionaireItem(data.docs./*[index]*/),
              QuestionaireItem(data.docs.first),
            );
          } else {
            return /*const*/ ErrorWidget(questionaires.data!);
          }
        }
        return /*const*/ Center(child: CircularProgressIndicator(),);
      }
    );
  }
}

class QuestionaireItem extends StatelessWidget {
  final QueryDocumentSnapshot _snapshot;
  // final String title;
  // final int id;
  final List<dynamic> questions;

  /*This will be used eventually*/
  // final String questionType;


  QuestionaireItem(this._snapshot) :
  questions = _snapshot.get("questions") as List<dynamic>;

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
    return Column(
      children:
      [
        
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
