import 'package:flutter/material.dart';
class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute)async {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      // Check if the previous and current routes are pages
      final previousPage = previousRoute.settings.name;
      final currentPage = route.settings.name;
      print("Navigation Observer");

    }
  }
}
