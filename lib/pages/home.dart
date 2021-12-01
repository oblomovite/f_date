import 'package:f_date/widgets/question_list.dart';
// import 'package:f_date/widgets/quiestionaire.dart';
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
  late List<AssetImage> listOfImage;
  bool clicked = false;
  List<String> listOfStr = [];
  late String images;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getImages();
  }

  void getImages() {
    listOfImage = [];
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
                Tab(icon: Icon(Icons.leaderboard_sharp)),
                Tab(icon: Icon(Icons.build)),
                Tab(icon: Icon(Icons.favorite_sharp)),
                Tab(icon: Icon(Icons.home)),
              ],
            ),
            title: Text('f-date'),
          ),
          body: TabBarView(
            children: [
              Tab(
                child:
                    QuestionList(),
              ),
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
