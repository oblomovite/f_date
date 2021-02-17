import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:async';
import 'package:f_date/utils/detectPlatform.dart';
import 'package:f_date/components/layout.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// email link authentication
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:f_date/controllers/login.dart';

// Init auth store
// FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> main() async {
  // Avoid errors caused by flutter upgrade.
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Implement host specific ui options
  if (kIsWeb) {
    // running on the web!
  } else {
    // NOT running on the web! You can check for additional platforms here.

  }
  runApp(App());
}

// TODO! Initialize Firebase
class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // check for errors in initialization
        if (snapshot.hasError) {
          // Placeholder
          return Text(
            'Something went wrong with firebase init!',
            style: Theme.of(context).textTheme.headline2,
          );
        }

        // Show application once complete
        if (snapshot.connectionState == ConnectionState.done) {
          return BooksApp();
        }

        // Load in the meantime
        return CircularProgressIndicator();
      },
    );
  }
}

class PlatformCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Detect Device is Android or iOS')),
            body: Center(child: detectPlatform())));
  }
}

class Book {
  final String title;
  final String author;
  Book(this.title, this.author);
}

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  // Todo move this out
  BookRouterDelegate _routerDelegate = BookRouterDelegate();
  BookRouteInformationParser _routeInformationParser =
      BookRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    // handle '/'
    if (uri.pathSegments.length == 0) {
      return BookRoutePath.home();
    }

    // handle '/book/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'book') return BookRoutePath.unknown();
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      if (id == null) return BookRoutePath.unknown();
      return BookRoutePath.details(id);
    }

    // handle unknown routes
    return BookRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(BookRoutePath path) {
    // TODO: Replace with switch
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }

    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }

    if (path.isDetailsPage) {
      return RouteInformation(location: '/books/${path.id}');
    }

    return null;
  }
}

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  Book _selectedBook;
  bool show404 = false;

  List<Book> books = [
    Book('Stranger in a Strange Land', 'Robert A. Heinlein'),
    Book('Foundation', 'Isaac Asimov'),
    Book('Fahrenheit 451', 'Ray Bradbury'),
  ];

  // call default constructor and initalize navigatorKey as an instance of GlobalKey
  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  BookRoutePath get currentConfiguration {
    if (show404) {
      return BookRoutePath.unknown();
    }
    return _selectedBook == null
        ? BookRoutePath.home()
        : BookRoutePath.details(books.indexOf(_selectedBook));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('HomePage'),
          child: 
           Layout(
            views: [
              Login(title: 'test',),
              // Text('Match: Hack sample BodyText1',
              //     style: Theme.of(context).textTheme.bodyText1),
              Text('Profile: Lato sample headline6',
                  style: Theme.of(context).textTheme.headline6),
              Text('Quiz: headline 1',
                  style: Theme.of(context).textTheme.headline1),
              Text('Settings: subtitle 2',
                  style: Theme.of(context).textTheme.subtitle2),
              Text('Messages', style: Theme.of(context).textTheme.headline6),
            ],
          ),
          // child: BooksListScreen(
          //   books: books,
          //   onTapped: _handleBookTapped,
          // ),
        ),
        if (show404)
          MaterialPage(
            key: ValueKey('UnknownPage'),
            child: UnknownScreen(),
          )
        else if (_selectedBook != null)
          BookDetailsPage(book: _selectedBook)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // update the list of pages by setting _selectedBook to null
        _selectedBook = null;
        show404 = false;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath path) async {
    if (path.isUnknown) {
      _selectedBook = null;
      show404 = true;
      return;
    }

    if (path.isDetailsPage) {
      if (path.id < 0 || path.id > books.length - 1) {
        show404 = true;
        return;
      }

      _selectedBook = books[path.id];
    } else {
      _selectedBook = null;
    }
    show404 = false;
  }

  void _handleBookTapped(Book book) {
    _selectedBook = book;
    notifyListeners();
  }
}

class BookDetailsPage extends Page {
  final Book book;

  BookDetailsPage({
    this.book,
  }) : super(key: ValueKey(book));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return BookDetailsScreen(book: book);
      },
    );
  }
}

class BookRoutePath {
  final int id;
  final bool isUnknown;

  BookRoutePath.home()
      : id = null,
        isUnknown = false;

  BookRoutePath.details(this.id) : isUnknown = false;

  BookRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;
  bool get isDetailsPage => id != null;
}

class BooksListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  BooksListScreen({
    @required this.books,
    @required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            )
        ],
      ),
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  BookDetailsScreen({
    @required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (book != null) ...[
              Text(
                book.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                book.author,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   // AppSettings settings = AppSettings();
//   SystemChrome.setPreferredOrientations(
//           [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
//       .then((_) => runApp(FDate(
//           // settings: settings
//           )));
// }

// class FDate extends StatelessWidget {
//   // final AppSettings settings;
//   // const MyApp({Key key, this.settings }) : super(key: key)
//
//   @override
//   Widget build(BuildContext context) {
//     // final theme = ThemeData(
//     //   // fontFamily: "Cabin",
//     //   primaryColor: AppColor.midnightSky,
//     //   accentColor: AppColor.midnightCloud,
//     //   primaryTextTheme: Theme.of(context).textTheme.apply(
//     //     bodyColor: AppColor.textColorDark,
//     //     displayColor: AppColor.textColorDark,
//     //   ),
//     //   textTheme: Theme.of(context).textTheme.apply(
//     //     bodyColor: AppColor.textColorDark,
//     //     displayColor: AppColor.textColorDark,
//     //   ),
//     // );
//
//     return MaterialApp(
//       title: 'F_Date',
//       debugShowCheckedModeBanner: false,
//       // theme: theme,
//       // home: PageContainer(settings: settings)
//       home: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             bottom: TabBar(
//               tabs: [
//                 Tab(icon: Icon(Icons.directions_car)),
//                 Tab(icon: Icon(Icons.directions_transit)),
//                 Tab(icon: Icon(Icons.directions_bike)),
//               ],
//             ),
//             title: Text('TabBar'),
//           ),
//           body: TabBarView(
//             children: [
//               Icon(Icons.directions_car),
//               Icon(Icons.directions_transit),
//               Icon(Icons.directions_bike),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
