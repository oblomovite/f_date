/* 
Passes the state between widgets and pages by using the 
InheritedWidget class as a provider.

The HomeBlocProvider class is used to pass the State between widgets and pages.
This is accomplished by the static method of() with allows children widgets to 
get the instance fo the HomeBlocProvider.

The updateShouldNotify method checks whether the value has changed and updates accordingly

*/

// import 'package:f_date/blocs/home_bloc.dart';
// import 'package:flutter/widgets.dart';

// class HomeBlocProvider extends InheritedWidget {
//   final HomeBloc homeBloc;
//   final String uid;

//   const HomeBlocProvider({
//     Key key,
//     Widget child,
//     this.homeBloc,
//     this.uid,
//   }) : super(key: key, child: child);

//   static HomeBlocProvider of(BuildContext context) {
//     return (context.dependOnInheritedWidgetOfExactType(aspect: HomeBlocProvider)
//         as HomeBlocProvider);
//   }

//   @override
//   bool updateShouldNotify(HomeBlocProvider old) =>
//     homeBloc != old.homeBloc;
// }
