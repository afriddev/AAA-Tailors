import 'package:flutter/material.dart';

import '../screens/searchSubPages/productInfo.dart';
import '../screens/searchSubPages/seeGuide.dart';
import '../screens/search_screen.dart';

class searchPageNavigator extends StatefulWidget {
  const searchPageNavigator({Key? key}) : super(key: key);

  @override
  State<searchPageNavigator> createState() => _searchPageNavigatorState();
}

class _searchPageNavigatorState extends State<searchPageNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (routeName) {
        Widget screenName = searchPage();
        if (routeName.name == "/productInfo")
          return animationController(routeName, productInfo());
        else if (routeName.name == "/searchPage") {
          return animationController(routeName, searchPage());
        } else if (routeName.name == "/seeGuide")
          return animationController(routeName, seeGuide());
        return MaterialPageRoute(builder: (_) => screenName);
      },
    );
  }
}

PageRouteBuilder animationController(routeName, Widget name) {
  return PageRouteBuilder(
      settings:
          routeName, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
      pageBuilder: (_, __, ___) => name,
      transitionsBuilder: (_, a, __, c) =>
          FadeTransition(opacity: a, child: c));
}
