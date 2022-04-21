import 'package:adomi_app/src/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routesApp = {
    'home': (_) => const HomeScreen(),
  };
}
