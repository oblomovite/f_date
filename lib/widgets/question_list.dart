import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';

/*
This widget contains the UI for a given questionaire -- 

Once a questionaire from the QuestionaireList has been selected this 
widget will appear

*/

class QuestionPrompt extends StatelessWidget {
  final String? prompt;
  final List<dynamic>? responses;
  final Function? onSelect;
  const QuestionPrompt({this.prompt, this.responses, this.onSelect});

  // QuestionPrompt.fromMap(Map<String, dynamic> data) {
  //   this.responses = data['responses'];
  // }

  @override
  Widget build(BuildContext context) {
    /* Make this fade-in? */
    return Container(
      child: Column(children: <Widget>[
        SizedBox(
          child: Text(
            // prompt,
            "whatever",
            
            textAlign: TextAlign.center,
          ),
          height: 100.0,
          width: 100.0,
        ),
        // responses! is a null check
            for (var i in responses!)
              Row(
                children: [
                  OutlinedButton(
                    child: Text(
                      i.toString(),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () => onSelect,
                  ),
                ],
              ),
      ]),
    );
  }
}

class QuestionList extends StatefulWidget {
  const QuestionList({Key? key}) : super(key: key);

  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  late int _questionIndex;
  late String selectedQuiz;

  // _QuestionListState({this.selectedQuiz});

  @override
  void initState() {
    print('initialized QuestionList Component');
    // _getThingsOnStartup().then((value){
    //   print('Async done');
    // });
    super.initState();
  }

  void _toggleNext() {
    setState(() {
      _questionIndex += 1;
    });
  }

  void _togglePrevious() {
    setState(() {
      _questionIndex -= 1;
    });
  }

  // Future _getThingsOnStartup() async {
  //   await Future.delayed(Duration(seconds: 2));
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DataSnapshot>(
      future: FirebaseDatabase.instance
          .reference()

          /// Todo repalce this with selectedQuiz
          .child('myers-briggs')
          // .child(selectedQuiz)
          .once(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          final result = snapshot.data.value;
          children = <Widget>[
            IndexedStack(
              index: _questionIndex,
              children: <Widget>[
                for (int i = 0; i < result.length; i++)
                  Column(
                    children: <Widget>[
                      QuestionPrompt(
                        prompt: result[i]["prompt"],
                        responses: result[i]["responses"],
                        onSelect: _toggleNext,
                      ),
                      // Row
                    ],
                  )
              ],
            )
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
