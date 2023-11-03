import 'package:flutter/material.dart';
import '../core/screens/profileSubPages/orders.dart';

class stateProvider extends ChangeNotifier {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  TextEditingController appoName =
      TextEditingController();
  TextEditingController appoPhNo =
  TextEditingController();
  TextEditingController appoMessage =
  TextEditingController();
  TextEditingController
  subscribeEmail =
  TextEditingController();

  bool splash = true;
  var _navIndex = 0;
  int get navIndex => _navIndex;
  void setNavIndex(int value) {
    _navIndex = value;
    notifyListeners();
  }

  List buttonColor = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  //selected sub products
  var _selectedSubProduct = 0;
  int get selectedSubProduct => _selectedSubProduct;
  void setSelectedSubProduct(int value) {
    _selectedSubProduct = value;
    notifyListeners();
  }

  TextEditingController searchField = TextEditingController();
  List selectedProduct = [
    [
      "Princess Cut Blouse",
      "https://raw.githubusercontent.com/afrid17/appImages/main/b11.jpeg",
      "https://raw.githubusercontent.com/afrid17/appImages/main/b12.jpeg",
      "999",
      "Explore our curated blouse collection, combining tradition and style for the perfect complement to your sarees and outfits.",
      "4.5",
      "1.5"
    ],
  ];
  int selectedIndex = 1;
  int selectedDays = 0;
  bool loggedIn = false;
  void setLoggedIn(bool value){
    loggedIn = value;
  }
  void setSplash(bool value){
    splash = value;
  }
  dynamic userData = null ;

  // var userData = {
  //   "userName": "shaik afrid",
  //   "email": "afridayan01@gmail.com",
  //   "image": "https://avatars.githubusercontent.com/u/138677681?v=4",
  //   "bagItems": [
  //     {
  //       "title": "Princess Cut Blouse",
  //       "image":
  //           "https://raw.githubusercontent.com/afrid17/appImages/main/b11.jpeg",
  //       "rating": 4.5,
  //       "price": 888,
  //       'count': 1
  //     },
  //     {
  //       "title": "Princess  ",
  //       "image":
  //           "https://raw.githubusercontent.com/afrid17/appImages/main/b11.jpeg",
  //       "rating": 4.5,
  //       "price": 132,
  //       'count': 1
  //     },
  //     {
  //       "title": " Cut Blouse",
  //       "image":
  //           "https://raw.githubusercontent.com/afrid17/appImages/main/b11.jpeg",
  //       "rating": 4.5,
  //       "price": 654,
  //       'count': 1
  //     },
  //   ],
  //   "orders": [
  //     {
  //       "title": " Cut Blouse",
  //       "image":
  //           "https://raw.githubusercontent.com/afrid17/appImages/main/b11.jpeg",
  //       "rating": 4.5,
  //       "price": 654,
  //       "status": "payment failed"
  //     },
  //     {
  //       "title": " Cut Blouse",
  //       "image":
  //           "https://raw.githubusercontent.com/afrid17/appImages/main/b11.jpeg",
  //       "rating": 4.5,
  //       "price": 654,
  //       "status": "error"
  //     },
  //     {
  //       "title": " Cut Blouse",
  //       "image":
  //           "https://raw.githubusercontent.com/afrid17/appImages/main/b11.jpeg",
  //       "rating": 4.5,
  //       "price": 654,
  //       "status": "completed"
  //     },
  //   ]
  // };
  //
}
