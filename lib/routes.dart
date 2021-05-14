import 'routes/camera/camera_screen.dart';
import 'package:flutter/material.dart';
import 'routes/home_page.dart';

/// Routing handler for the app
class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case cameraPage:
        return MaterialPageRoute<CameraScreen>(
            builder: (_) => CameraScreen());
      case homePage:
        return MaterialPageRoute<HomePage>(
          builder: (_) => const HomePage(),
        );

      default:
        throw RouteException("Route not found");
    }
  }

  /// Home page
  static const homePage = '/';

  /// Camera screen
  static const cameraPage = '/camera';
}

/// Exception thrown when a given route doesn't exist
class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
