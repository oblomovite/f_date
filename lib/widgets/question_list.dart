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
  final VoidCallback onSelect;
  const QuestionPrompt({
      required this.prompt,
      required this.responses,
      required this.onSelect
  });

  @override
  Widget build(BuildContext context) {
    /* Make this fade-in? */
    return Container(
      child: Column(children: <Widget>[
          SizedBox(
            child: Text(
              prompt.toString(),
              textAlign: TextAlign.center,
            ),
            height: 100.0,
            width: 100.0,
          ),
          for (var i in responses!)
          Row(children: [
              OutlinedButton(
                onPressed: onSelect,
                child: Text(
                  i.toString(),
                  textAlign: TextAlign.center,
                ),
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

    setState(() {
        _questionIndex = 0;
    });
    super.initState();
  }

  void _toggleNext() {
    print('click happen');
    setState(() {
        _questionIndex += 1;
    });
  }

  void _togglePrevious() {
    setState(() {
        _questionIndex -= 1;
    });
  }

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
          var questions = <Widget>[
            for (int i = 0; i < result.length; i++)
            QuestionPrompt(
              prompt: result[i]["prompt"],
              responses: result[i]["responses"],
              onSelect: () {
                setState(() {
                    print('anything?');
                    _questionIndex += 1;
                });
              },
            ),
          ];
          children = <Widget>[
            IndexedStack(
              index: _questionIndex,
              children: questions
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
