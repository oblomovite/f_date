/*
Main entry point for the application

contains logic to switch between pages depending on 
the authentication state available

*/

import 'package:f_date/repository/user_repository/firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:f_date/repository/user_repository/test_repository.dart';
import 'package:f_date/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'blocs/authentication_bloc.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Provider<FirebaseUserRepository>(
    create: (_) => const FirebaseUserRepository(),
    // create: (_) => const TestUserRepository(
    //   fakeEmail: "alberto@miola.it",
    //   success: true,
    // ),
    child: App(), //LoginApp(),
  ));
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

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
          return BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(repository),
            child: MaterialApp(
              initialRoute: RouteGenerator.homePage,
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
