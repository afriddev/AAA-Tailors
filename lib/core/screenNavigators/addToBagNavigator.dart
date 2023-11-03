import 'package:flutter/material.dart';
import '../screens/addToBagSubPages/paymentFailed.dart';
import '../screens/addToBagSubPages/paymentSucess.dart';

import '../screens/addToBag.dart';

class addToBagNavigator extends StatefulWidget {
  const addToBagNavigator({Key? key}) : super(key: key);

  @override
  State<addToBagNavigator> createState() => _addToBagNavigatorState();
}

class _addToBagNavigatorState extends State<addToBagNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (routeName) {
        Widget screenName = addToBag(
          cont: context,
        );
        if (routeName.name == "/addToCartPage")
          return animationController(
              routeName,
              addToBag(
                cont: context,
              ));
        else if(routeName.name == "/paymentSuccess") return
          animationController
            (routeName,paymentSuccess());

        else if(routeName.name == "/paymentFailed") return
          animationController
            (routeName,paymentFailed());


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
