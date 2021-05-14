import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:f_date/pages/home.dart';
import 'package:f_date/pages/login_page.dart';

import 'package:f_date/blocs/authentication_bloc.dart';

/// Home widget containing a tab that programmatically
/// swipes between login form and the welcome page

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  /// Sliding animation to show the login form
  void loginTransition() {
    if (tabController.index != 1) tabController.animateTo(1);
  }

  /// Sliding animation to show the welcome page
  void logoutTransition() {
    if (tabController.index != 0) tabController.animateTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {

    /*
    Handles Authentication States -- uncomment when not developing
    // This state is emitted on successful authentication
    // if (state is AuthenticationSuccess) {
    //   loginTransition();
    // }

    // This state is emitted on logout
    // if (state is AuthenticationRevoked) {
    //   logoutTransition();
    // }
    */

      /// Just log-in for development 
      loginTransition();

      return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          LoginPage(),
          // WelcomePage(),
          Home()
        ],
      );
    });
  }
}
