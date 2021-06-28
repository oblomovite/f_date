import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizList extends StatefulWidget {
  @override
  _QuizListState createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {

  late String _targetImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Placeholder"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

        //     /// Draggable
        //     Draggable<String>(
        //       // data: "data - string",
        //       child: Container(
        //         width: 300,
        //         height: 200,
        //         alignment: Alignment.center,
        //         color: Colors.purple,
        //         child: Text('do something else'),
        //         // child: Image.network(
        //         //   'https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg',
        //         //   fit: BoxFit.cover,
        //         // ),
        //       ),
        //       feedback: Opacity(
        //         opacity: 0.4,
        //         child: Container(
        //           color: Colors.purple,
        //           width: 300,
        //           height: 200,
        //           alignment: Alignment.center,
        //           child: Image.network(
        //             'https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg',
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //       ),
        //     ),
        //       SizedBox(height: 50),
        //       ////////////////////////
        //       /// Target
        //       DragTarget<String>(
        //         onAccept: (value) {
        //           setState(() {
        //             _targetImageUrl = value;
        //           });
        //         },
        //     // Widget to show under the pointer when a drag is under way
        // 
        //         builder: (_, candidateData, rejectedData) {
        //           return Container(
        //             width: 300,
        //             height: 200,
        //             color: Colors.amber,
        //             alignment: Alignment.center,
        //             child: _targetImageUrl != null
        //                 ? Image.network(
        //                     _targetImageUrl,
        //                     fit: BoxFit.cover,
        //                   )
        //                 : Container(),
        //           );
        //         },
        //       ),
              
            ],
          ),

        ),
        
        // Center(
        //   child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: <Widget>[
        //     /// Draggable
        //     Draggable<String>(
        //       // data: "data - string",
        //       child: Container(
        //         width: 300,
        //         height: 200,
        //         alignment: Alignment.center,
        //         color: Colors.purple,
        //         child: Text('do something else'),
        //         // child: Image.network(
        //         //   'https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg',
        //         //   fit: BoxFit.cover,
        //         // ),
        //       ),
        //       feedback: Opacity(
        //         opacity: 0.4,
        //         child: Container(
        //           color: Colors.purple,
        //           width: 300,
        //           height: 200,
        //           alignment: Alignment.center,
        //           child: Image.network(
        //             'https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg',
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //       ),
        //     ),
        //       SizedBox(height: 50),
        //       ////////////////////////
        //       /// Target
        //       DragTarget<String>(
        //         onAccept: (value) {
        //           setState(() {
        //             _targetImageUrl = value;
        //           });
        //         },
        //     // Widget to show under the pointer when a drag is under way
        // 
        //         builder: (_, candidateData, rejectedData) {
        //           return Container(
        //             width: 300,
        //             height: 200,
        //             color: Colors.amber,
        //             alignment: Alignment.center,
        //             child: _targetImageUrl != null
        //                 ? Image.network(
        //                     _targetImageUrl,
        //                     fit: BoxFit.cover,
        //                   )
        //                 : Container(),
        //           );
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
