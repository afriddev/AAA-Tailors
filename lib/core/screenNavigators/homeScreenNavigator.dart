import 'package:flutter/material.dart';
import '../screens/homeScreenSubPages/measurements.dart';
import '../screens/homeScreenSubPages/allProducts.dart';
import '../screens/homeScreenSubPages/bookAppointment.dart';
import '../screens/homeScreenSubPages/mainProducts.dart';
import '../screens/homeScreenSubPages/productInfo.dart';
import '../screens/homeScreenSubPages/seeGuide.dart';
import '../screens/home_screen.dart';

class homeScreenNavigator extends StatefulWidget {
  const homeScreenNavigator({Key? key}) : super(key: key);

  @override
  State<homeScreenNavigator> createState() => _homeScreenNavigatorState();
}

class _homeScreenNavigatorState extends State<homeScreenNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (routeName) {
        // Widget screenName = noConnection();
//
        Widget screenName = homeScreen();

        // Widget screenName = measurements();
        // Widget screenName = homeScreen();
        // Widget screenName = mainProducts();
        // Widget screenName = allProducts();
        // Widget screenName = productInfo();
        // Widget screenName = seeGuide();
        // Widget screenName = bookAppointment();
        if (routeName.name == "/productsPage")
          return animationController(routeName, mainProducts());
        else if (routeName.name == "/homePage")
          return animationController(routeName, homeScreen());
        else if (routeName.name == "allProducts")
          return animationController(routeName, allProducts());
        else if (routeName.name == "/productInfo")
          return animationController(routeName, productInfo());
        else if (routeName.name == "/seeGuide")
          return animationController(routeName, seeGuide());
        else if (routeName.name == "/bookAppointemnt")
          return animationController(routeName, bookAppointment());
        else if (routeName.name == "/measuerements")
          return animationController(routeName, measurements());

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
