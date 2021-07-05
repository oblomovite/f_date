/*
Main entry point for the application

contains logic to switch between pages depending on 
the authentication state available

*/

import 'package:camera/camera.dart';
import 'package:f_date/repository/user_repository/firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:f_date/repository/user_repository/test_repository.dart';
import 'package:f_date/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'blocs/authentication_bloc.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

List<CameraDescription> cameras = [];

void logError(String code, String? message) {
  if (message != null) {
    print('Error: $code\nError Message: $message');
  } else {
    print('Error: $code');
  }
}

Future<void> main() async {
// This call makes sure the camera plugin has been
// properly initialized and it's ready to be used.
  // WidgetsFlutterBinding.ensureInitialized();

  // await Hive.initFlutter();
  // Move to camera widget
  // final cameras = await availableCameras();
  // final firstCamera = cameras.first;

  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }

  runApp(Provider<FirebaseUserRepository>(
    create: (_) => FirebaseUserRepository(),
    // create: (_) => const TestUserRepository(
    //   fakeEmail: "alberto@miola.it",
    //   success: true,
    // ),
    child: App(), //LoginApp(),
  ));
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}


class _AppState extends State<App> {
  Future<FirebaseApp> get _initialization => Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final repository = context.select((FirebaseUserRepository r) => r);
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          // return LoginApp();
          /// TOOD: // return MultiProvider(providers: [],)
          return BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(repository),

            /// Optimization tells Bloc not to re-render the following stateless widget
            child: MaterialApp(
              /// Load initial page
              initialRoute: RouteGenerator.homePage,

              ///
              onGenerateRoute: RouteGenerator.generateRoute,
              // localizationsDelegates: [
              //   const AppLocalizationDelegate(),
              //   GlobalMaterialLocalizations.delegate,
              //   GlobalCupertinoLocalizations.delegate,
              //   GlobalWidgetsLocalizations.delegate,
              // ],
              // supportedLocales: [
              //   Locale.fromSubtags(languageCode: "en"),
              //   Locale.fromSubtags(languageCode: "it"),
              // ],
              // onGenerateTitle: (context) => context.localize("title"),
              onGenerateTitle: (context) => "title",
              debugShowCheckedModeBanner: false,
            ),
          );
        }
        // Fix this obviously
        // Otherwise, show something whilst waiting for initialization to complete
        // return LoginApp();
        return CircularProgressIndicator();
      },
    );
  }
}
