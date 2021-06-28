// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// /// Set of widgets to check connectionState
// class ConnectionWidget extends StatelessWidget {
//   static final _conn = Connectivity();
//   const ConnectionWidget();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<ConnectivityResult>(
//       stream: _conn.onConnectivityChanged,
//       builder: (context, status) {
//         if (status.hasData) {
//           final data = status.data;
//           if (data != null) {
//             switch (data) {
//               case ConnectivityResult.wifi:
//                 return const WifiConnectionWidget();

//               case ConnectivityResult.mobile:
//                 return const MobileConnectionWidget();

//               case ConnectivityResult.none:
//                 return const NoConnectionWidget();
//             }
//           } else {
//             debugPrint("Error with connectivity widgets");
//           }
//         }
//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }

// class WifiConenctionWidiget extends StatelessWidget {
//   const WifiConenctionWidiget();

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 20,
//       crossAxisAlignment: WrapCrossAlignment.center,
//       direction: Axis.vertical,
//       children: const <Widget>[Icon(Icons.wifi), Text("Connected to Wifi")],
//     );
//   }
// }

// /// TODO
// // class MobileConenctionWidiget extends StatelessWidget {}
// // class NoConenctionWidiget extends StatelessWidget {}
