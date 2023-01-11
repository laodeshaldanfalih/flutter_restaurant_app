import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation {
  static intentWithData(String rounteName, Object arguments) {
    navigatorKey.currentState?.pushNamed(rounteName, arguments: arguments);
  }

  static back() => navigatorKey.currentState?.pop();
}
