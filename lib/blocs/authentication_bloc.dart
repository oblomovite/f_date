library authentication_bloc;

export 'authentication_bloc/bloc.dart';
export 'authentication_bloc/events.dart';
export 'authentication_bloc/states.dart';

// import 'dart:async';
// // import 'package:f_date/services/authentication_api.dart';
// import 'package:f_date/services/authentication.dart';
// 
// class AuthenticationBloc {
//   // final AuthenticationApi authenticationApi;
// 
//   final AuthenticationService authenticationService;
//   final StreamController<String> _authenticationController =
//       StreamController<String>();
// 
//   Sink<String> get addUser => _authenticationController.sink;
//   Stream<String> get user => _authenticationController.stream;
// 
//   final StreamController<bool> _logoutController = StreamController<bool>();
//   Sink<bool> get logoutUser => _logoutController.sink;
//   Stream<bool> get listLogoutUser => _logoutController.stream;
// 
//   AuthenticationBloc(this.authenticationService) {
//     onAuthChanged();
//   }
// 
//   // close out authentication streams when relevant widget not in use
//   void dispose() {
//     _authenticationController.close();
//     _logoutController.close();
//   }
// 
//   // responsible for setting up a listener to check when the user logs in and out
//   void onAuthChanged() {
//     authenticationService.getFirebaseAuth().authStateChanges().listen((user) {
//       final String uid = user != null ? user.uid : null;
//       addUser.add(uid);
//     });
//     _logoutController.stream.listen((logout) {
//       if (logout == true) {
//         _signOut();
//       }
//     });
//   }
// 
//   void _signOut() {
//     authenticationService.signOut();
//   }
// }