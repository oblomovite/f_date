import 'package:f_date/widgets/quiestionaire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:firebase_storage/firebase_storage.dart';

class Home extends StatefulWidget {
  const Home();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var storage = FirebaseStorage.instance;
  List<AssetImage> listOfImage;
  bool clicked = false;
  List<String> listOfStr = List();
  String images;
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    getImages();
  }

  void getImages() {
    listOfImage = List();
    for (int i = 0; i < 6; i++) {
      listOfImage.add(
        AssetImage('assets/images/travelimage' + i.toString() + '.jpeg'));
    }
  }

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'F_Date',
        debugShowCheckedModeBanner: false,
        // theme: theme,
        // home: PageContainer(settings: settings)
        home: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.bar_chart)),
                  // Tab(icon: Icon(Icons.email_sharp)),
                  // Tab(icon: Icon(Icons.message)),
                  // Tab(icon: Icon(Icons.miscellaneous_services)),
                  // Tab(icon: Icon(Icons.settings_applications_sharp)),
                  // Tab(icon: Icon(Icons.settings_sharp)),
                  // Tab(icon: Icon(Icons.show_chart_sharp)),
                  // Tab(icon: Icon(Icons.question_answer_sharp)),
                  Tab(icon: Icon(Icons.leaderboard_sharp)),
                  Tab(icon: Icon(Icons.build)),
                  Tab(icon: Icon(Icons.favorite_sharp)),
                  Tab(icon: Icon(Icons.home)),
                ],
              ),
              title: Text('TabBar'),
            ),
            body: TabBarView(
              children: [
                // Tab(icon: Icon(Icons.bar_chart)),
                Tab(child: Questionaire(),),
                Tab(icon: Icon(Icons.leaderboard_sharp)),
                Tab(icon: Icon(Icons.build)),
                Tab(icon: Icon(Icons.favorite_sharp)),
                Tab(icon: Icon(Icons.home)),
              ],
            ),
          ),
        ),
      );
    }
}
