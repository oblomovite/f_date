import 'package:flutter/material.dart';
import 'dart:io' show Platform;

Widget detectPlatform() {
  if (Platform.isAndroid) {
    // Return here any Widget you want to display in Android Device.
    return Text('Android Device Detected', style: TextStyle(fontSize: 22));
  } else if (Platform.isIOS) {
    // Return here any Widget you want to display in iOS Device.
    return Text('iOS Device Detected', style: TextStyle(fontSize: 22));
  }
}
