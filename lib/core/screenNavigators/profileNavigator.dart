import '../../helper/server/getUser'
    '.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../state/stateProvider.dart';

import '../screens/profileSubPages/contactUs.dart';
import '../screens/profileSubPages/developer.dart';
import '../screens/profileSubPages/howItWorks.dart';
import '../screens/profileSubPages/loginPage.dart';
import '../screens/profileSubPages/orders.dart';
import '../screens/profilePage.dart';
import '../screens/profileSubPages/signUpPage.dart';

class profileNavigator extends StatefulWidget {
   profileNavigator({Key? key,required this.con}) : super(key: key);
   BuildContext con;
  @override
  State<profileNavigator> createState() => _profileNavigatorState();
}
class _profileNavigatorState extends State<profileNavigator> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();



  // void test(){
  //    screenName = Provider.of<stateProvider>(context,listen:false).loggedIn
  //         ? profilePage()
  //         :loginPage();
  //
  //   prefs.then((pref){
  //     bool loggedIn = pref.getBool("loggedIn") ?? false;
  //         if(loggedIn){
  //           setState(() {
  //             print(pref.getBool("loggedIn"));
  //             print(screenName);
  //             print(Provider.of<stateProvider>(context,listen:false).loggedIn);
  //             screenName = profilePage();
  //           });
  //
  //         }
  //       });
  //
  //
  // }


  @override
  void initState() {

    super.initState();
    // test();
    // setUserData();
  }
  @override
  Widget build(BuildContext context) {
    Widget screenName = Provider
        .of<stateProvider>(context,
        listen:false)
        .loggedIn?profilePage()
        :loginPage();
    return Navigator(
      onGenerateRoute: (routeName) {
        if (routeName.name == "/orderHistory") {
          return animationController(
              routeName,
              orders(
                cont: context,
              ));
        } else if (routeName.name == "/howItWorks") {
          return animationController(routeName, howItWorks());
        } else if (routeName.name == "/profile") {
          return animationController(routeName, profilePage());
        } else if (routeName.name == "/developer") {
          return animationController(routeName, developer());
        } else if (routeName.name == '/contactUs') {
          return animationController(routeName, contactUs());
        } else if (routeName.name == "/signUp")
          return animationController(routeName, signUpPage());
        else if (routeName.name == "/login")
          return animationController(routeName, loginPage());
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
