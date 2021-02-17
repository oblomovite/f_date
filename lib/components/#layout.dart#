import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:f_date/theme/theme.dart';

/* 

The Layout Component is a basic scaffolding widget that contains 
elements common across different application views

*/

  
class Layout extends StatelessWidget {
  List<Widget> views;
  Layout({
      // Key? key,
      Key key,
      @required this.views,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: TabBar(
              tabs: [
                //  Placeholder icons
                Tab(icon: Icon(Icons.bar_chart)), 
                Tab(icon: Icon(Icons.message)),
                Tab(icon: Icon(Icons.question_answer_sharp)),
                Tab(icon: Icon(Icons.favorite_sharp)),
                Tab(icon: Icon(Icons.settings_sharp)),
              ],
          ),
          body: TabBarView(
            children: [
              // Need to put something here in case these dont load properly
              for ( var i in views ) i
            ],
          ),
        ),
      ),
    );
  }
}
