import '../helper/server/getUser.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/screenNavigators/addToBagNavigator.dart';
import '../core/screenNavigators/homeScreenNavigator.dart';
import '../core/screenNavigators/profileNavigator.dart';
import '../core/screenNavigators/searchPageNavigator.dart';
import '../core/utils/bottomNavBar.dart';
import '../state/stateProvider.dart';
import 'package:provider/provider.dart';

class mainScreenNavigator extends StatefulWidget {
  const mainScreenNavigator({Key? key}) : super(key: key);

  @override
  State<mainScreenNavigator> createState() => _mainScreenNavigatorState();
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class _mainScreenNavigatorState extends State<mainScreenNavigator> {
  List splashImages = [
    "images/sp1.jpg",
    "images/sp2.jpg",
    "images/sp3.jpg",
  ];
  List Content = [
    ["Any Style, Any Design", "Made For You"],
    ["Consult Our", "Fashion Designer"],
    ["Track Your", "Order Status"]
  ];
  int imageIndex = 0;
  late String screenMovement;
  bool splash = false;

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  bool connection = true;
  void checkConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      setState(() {
        connection = true;
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        connection = true;

      });
    } else {
      setState(() {
        connection = false;
      });
    }
  }
  void setUserData()async {
    SharedPreferences pref = await
    SharedPreferences.getInstance();
    dynamic getEmail = pref.getString(
        "email");

    if(getEmail == null){

    }
    else{
      dynamic
      getuser =
      await getUser(

          email: getEmail)
          .findUser();
      setState(() {
        Provider
            .of<stateProvider>(
            context,
            listen: false)
            .userData = getuser;
      });
    }
  }
  @override
  void initState() {

    super.initState();
    prefs.then((value){
      splash = value.getBool
        ("splash") ?? true;
      if(splash){
        splash = true;
      }
      else{
        splash = false;
      }

    });
    prefs.then((pref){
          bool loggedIn = pref.getBool("loggedIn") ?? false;
              if(loggedIn){
                Provider
                    .of<stateProvider>(context,listen:false).loggedIn = true;
                };


            });

      checkConnection();
    setUserData();

  }

  @override
  Widget build(BuildContext context) {
    List screens = [
      homeScreenNavigator(),
      searchPageNavigator(),
      addToBagNavigator(),
      profileNavigator(
        con:context,
      )
    ];
    FlutterView view = PlatformDispatcher.instance.views.first;
    double physicalWidth = view.physicalSize.width;
    double physicalHeight = view.physicalSize.height;
    double devicePixelRatio = view.devicePixelRatio;
    double _deviceWidth = physicalWidth / devicePixelRatio;
    double _deviceHeihgt = physicalHeight / devicePixelRatio;

    // Size size = WidgetsBinding.instance.window.physicalSize;
    // double ratio = WidgetsBinding.instance.window.devicePixelRatio;
    // double _deviceWidth = size.width / ratio;
    // double _deviceHeihgt = size.height / ratio;

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.green[800]
      ),
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: splash
                ? SafeArea(
                    child: GestureDetector(
                        onPanUpdate: (details) {
                          setState(() {
                            screenMovement =
                                details.delta.dx < 0 ? "right" : "left";
                          });
                        },
                        onPanEnd: (d) {
                          if (screenMovement == "right") {
                            if (imageIndex < 2) {
                              imageIndex++;
                            }
                          } else {
                            if (imageIndex > 0) {
                              imageIndex--;
                            }
                          }
                        },
                        child: Container(
                          width: _deviceWidth,
                          height: _deviceHeihgt,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: _deviceWidth,
                                height: _deviceHeihgt * 0.7,
                                child: Image(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage(splashImages[imageIndex])),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(),
                                      child: Text(
                                        Content[imageIndex][0],
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: Color(0xff380442),
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 20)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        Content[imageIndex][1],
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: Color(0xff380442),
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 23)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 15, top: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 10),
                                              child: DotsIndicator(
                                                dotsCount: 3,
                                                position: imageIndex,
                                                decorator: DotsDecorator(
                                                  activeColor: Colors.purple,
                                                  color: Colors.grey.shade400,
                                                  size: const Size.square(9.0),
                                                  activeSize:
                                                      const Size(20.0, 9.0),
                                                  activeShape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0)),
                                                ),
                                              )),
                                          imageIndex >= 2
                                              ? GestureDetector(
                                                  onTap: () async {
                                                    await prefs.then((prefs) {
                                                      prefs.setBool(
                                                          "splash", false);
                                                    }, onError: (error) {
                                                      // print(error);
                                                    });
                                                    setState(() {
                                                      splash = false;
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 20,
                                                    ),
                                                    child: Container(
                                                      width:
                                                          _deviceWidth * 0.25,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .yellow[700],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                offset: Offset(
                                                                    -5, -5),
                                                                color: Colors
                                                                    .grey
                                                                    .shade200,
                                                                blurRadius: 10),
                                                            BoxShadow(
                                                                offset: Offset(
                                                                    5, 5),
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                blurRadius: 10),
                                                          ]),
                                                      child: Center(
                                                          child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            child: Text(
                                                              "GO",
                                                              style: GoogleFonts.roboto(
                                                                  textStyle: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          22,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      letterSpacing:
                                                                          2)),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                              bottom: 1,
                                                            ),
                                                            child: Icon(
                                                                Icons
                                                                    .arrow_right_outlined,
                                                                color: Colors
                                                                    .black,
                                                                size: 40),
                                                          )
                                                        ],
                                                      )),
                                                    ),
                                                  ),
                                                )
                                              : Text("")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )))
                : connection
                    ? screens[Provider.of<stateProvider>(context, listen: true)
                        .navIndex]
                    : SafeArea(
                        child: Container(
                        width: _deviceWidth,
                        height: _deviceHeihgt,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: _deviceWidth,
                              height: _deviceHeihgt * 0.8,
                              child: Image(
                                image: AssetImage("images/noConnection.jpg"),
                              ),
                            ),
                            GestureDetector(
                                onTap: () => checkConnection(),
                                child: Padding(
                                  padding: EdgeInsets.only(),
                                  child: Container(
                                    width: _deviceWidth * 0.5,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.yellow[700],
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(-5, -5),
                                              blurRadius: 10,
                                              color: Colors.grey.shade200),
                                          BoxShadow(
                                              offset: Offset(5, 5),
                                              blurRadius: 10,
                                              color: Colors.grey.shade400),
                                        ]),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Retry",
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w400,
                                                    letterSpacing: 2)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(),
                                            child: Icon(
                                              Icons.loop,
                                              size: 25,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )),
            bottomNavigationBar: splash
                ? Text("")
                : connection
                    ? bottomNavBar()
                    : Text(""),
          ),
        ));
  }
}
