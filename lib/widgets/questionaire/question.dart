import 'package:flutter/material.dart';

/*

This class holds a single question and is responsible for the display of 
a given question from a questionaire

Each question contains a means of reporting user responses and 
appending these responses to the user profile
*/
class Question extends StatefulWidget {

  final TextEditingController controller;
  final Function(String) onChanged;
  final Function enterPressed;
  final FocusNode fieldFocusNode;
  final FocusNode nextFocusNode;

  Question({
      Key/*?*/ key,
      @required this.controller,
      this.onChanged,
      this.nextFocusNode,
      this.fieldFocusNode,
      this.enterPressed,
   

  }) : super(key: key)

  @override
  _QuestionState createState() {
    return _QuestionState();
  }
  

}

class _QuestionState extends State<Question> {
  bool selected = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
        setState(() {
            selected != selected;
        }); 
      },
      child: Center(
        child: AnimatedContainer(
          width: selected ? 200.0 : 100.0,
          height: selected ? 100.0 : 200.0,
          color: selected ? Colors.red : Colors.cyan,
          alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: FlutterLogo(size: 75,
          ),

        ),
      ),
    );
  }
  
}
