import 'package:flutter/material.dart';

class RouteProvider with ChangeNotifier {
  int _route = 0;

  int get route => _route;

  void updateRoute(int newRoute) {
    _route = newRoute;
    notifyListeners(); // Notify listeners when the route changes.
  }
}
