import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  // final AppSettings settings;
  // const MyApp({Key key, this.settings }) : super(key: key)

  @override
  Widget build(BuildContext context) {
    // final theme = ThemeData(
    //   // fontFamily: "Cabin",
    //   primaryColor: AppColor.midnightSky,
    //   accentColor: AppColor.midnightCloud,
    //   primaryTextTheme: Theme.of(context).textTheme.apply(
    //     bodyColor: AppColor.textColorDark,
    //     displayColor: AppColor.textColorDark,
    //   ),
    //   textTheme: Theme.of(context).textTheme.apply(
    //     bodyColor: AppColor.textColorDark,
    //     displayColor: AppColor.textColorDark,
    //   ),
    // );

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
                Tab(icon: Icon(Icons.bar_chart)),
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
