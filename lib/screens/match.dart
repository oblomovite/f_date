import 'package:flutter/material.dart';

class MatchScreen extends StatefulWidget {
  // final AppSettings settings;
  // const MyApp({Key key, this.settings }) : super(key: key)


  // TODO: What is the difference between these two?
  // @override
  // _MatchState createState() => _MatchState();

  @override
  State<StatefulWidget> createState() => _MatchScreenState();


}



class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    MatchRouterDelegate _routerDelegate = MatchRouterDelegate();
    MatchRouteInformationParser _routeInformationParser = MatchRouteInformationParser();

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
      // TODO: This needs to go into /components since this is meant to be reused on every page
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

class MatchRoutePath {
  final int id;
  final bool isUnknown;

  MatchRoutePath.home() : id = null, isUnknown = false;

  MatchRoutePath.details(this.id) : isUnknown = false;

  MatchRoutePath.unknown() : id = null, isUnknown = true;

  bool get isHomePage => id == null;
  bool get isDetailsPage => id != null;

}

class MatchRouteInformationParser extends RouteInformationParser<MatchRoutePath> {
  @override
  Future<MatchRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    // handle '/'
    if (uri.pathSegments.length == 0) {
      return MatchRoutePath.home();
    }

    // handle '/match/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'match') return MatchRoutePath.unknown();
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      if (id == null) return MatchRoutePath.unknown();
      return MatchRoutePath.details(id);
    }

    // handle unknown routes
    return MatchRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(MatchRoutePath path) {
    // TODO: Replace with switch
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }

    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }

    if (path.isDetailsPage) {
      return RouteInformation(location: '/match/${path.id}');
    }

    return null;
  }
}

class MatchRouterDelegate extends RouterDelegate<MatchRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MatchRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  Match _selectedMatch;
  bool show404 = false;
  
  // TODO: http request goes here
  // List<Match> books = [
  //   Match('Stranger in a Strange Land', 'Robert A. Heinlein'),
  //   Match('Foundation', 'Isaac Asimov'),
  //   Match('Fahrenheit 451', 'Ray Bradbury'),
  // ];

  // call default constructor and initalize navigatorKey as an instance of GlobalKey
  MatchRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  MatchRoutePath get currentConfiguration {
    if (show404) {
      return MatchRoutePath.unknown();
    }
    return _selectedMatch == null
    ? MatchRoutePath.home()
    : MatchRoutePath.details(books.indexOf(_selectedMatch));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          // key: ValueKey('MatchsListPage'),
          key: ValueKey('HomePage'),

          // TODO: container for list of matches goes here
          child: MatchsListScreen(
              books: books,
              onTapped: _handleMatchTapped,
            ),

          ),


          if (show404) 
          MaterialPage(
            key: ValueKey('UnknownPage'),
            child: UnknownScreen(),)
          else if (_selectedMatch != null) 
          MatchDetailsPage(book: _selectedMatch)

      ],
          

      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // update the list of pages by setting _selectedMatch to null
        _selectedMatch = null;
        show404 = false;
        notifyListeners();
        return true;
        
      },
    );
  }

  @override
  Future<void> setNewRoutePath(MatchRoutePath path) async {
    if (path.isUnknown) {
      _selectedMatch = null;
      show404 = true;
      return;
    }

    if (path.isDetailsPage) {
      if (path.id < 0 || path.id > books.length - 1) {
        show404 = true;
        return;
      }

      _selectedMatch = books[path.id];

    } else {
      _selectedMatch = null;
    }
    show404 = false;
  }

  void _handleMatchTapped(Match match){
    _selectedMatch = match;
    notifyListeners();
  }
}

