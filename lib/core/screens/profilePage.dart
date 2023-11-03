import '../../helper/server/getUser'
    '.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'profileSubPages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../state/stateProvider.dart';
import 'package:provider/provider.dart';
class profilePage
    extends StatefulWidget {
  const profilePage({Key? key})
      : super(key: key);
  @override
  State<profilePage> createState() =>
      _profilePageState();
}
class _profilePageState
    extends State<profilePage> {

  bool user = false;
  dynamic imageurl = "";
  bool noUserName = false;
  String username = "";
  dynamic userEmail;
  void getUserDate()async{

    dynamic a =
        Provider.of<stateProvider>(
            context,
            listen: false)
            .userData;
    if (a == null) {
      setState(() {
        user = false;
      });
    } else {
      setState(() {
        try {
          if (a['image'] == "") {
            user = false;
            setState(() {
              print(a);
              noUserName = false;
              username = a['userName'];
              userEmail = a['email'];
            });
          } else {
            print(a);
            user = true;
            dynamic imag = a["image"];
            if (imag == "") {
              user = false;
            }
            else{
              user = true;
              imageurl = imag;
            }
          }
        } catch (e) {
          user = false;
        }
      });
    }
  }
  dynamic  pickedFile;
  dynamic  imageData;

  // dynamic profilePicture() async {
  //
  //
  //     pickedFile = await FilePicker.platform.pickFiles();
  //
  //     if (pickedFile != null) {
  //       imageData =
  //           pickedFile.files.first;
  //       dynamic firebaseStorage = FirebaseStorage.instance
  //           .ref(userEmail + "." + imageData.extension)
  //           .putData(imageData.bytes);
  //       dynamic ref = FirebaseStorage.instance
  //           .ref()
  //           .child(userEmail + "." + imageData.extension);
  //     }
  //     else{
  //       print("-----------");
  //       print("Else block");
  //       print("-------------");
  //
  //     }
  //
  // }
  @override
  void initState() {
    super.initState();
    getUserDate();
  }


  @override
  Widget build(BuildContext context) {
    var _deviceWidth =
        MediaQuery.of(context)
            .size
            .width;
    var _deviceHeight =
        MediaQuery.of(context)
            .size
            .height;
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 10),
          child: Container(
            width: _deviceWidth,
            height: 60,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                Padding(
                    padding:
                        EdgeInsets.only(
                            left: 10),
                    child:
                        GestureDetector(
                      onTap: () {
                        Provider.of<stateProvider>(
                                context,
                                listen:
                                    false)
                            .setNavIndex(
                                2);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration:
                            BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors
                                    .grey
                                    .shade200,
                                blurRadius:
                                    10,
                                offset: Offset(
                                    -5,
                                    -5)),
                            BoxShadow(
                                color: Colors
                                    .grey
                                    .shade400,
                                blurRadius:
                                    10,
                                offset: Offset(
                                    5,
                                    5)),
                          ],
                          color: Colors
                              .white,
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      10),
                        ),
                        child: Padding(
                          padding: EdgeInsets
                              .only(
                                  left:
                                      10),
                          child: Center(
                              child:
                                  Icon(
                            Icons
                                .arrow_back_ios,
                            size: 24,
                            color: Colors
                                .black,
                          )),
                        ),
                      ),
                    )),
                Container(
                  width: _deviceWidth *
                      0.6,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit
                              .fill,
                          image: AssetImage(
                              "images/logo.png"))),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<stateProvider>(
                            context,
                            listen:
                                false)
                        .setNavIndex(2);
                  },
                  child: Padding(
                      padding: EdgeInsets
                          .only(
                              right: 20,
                              top: 15),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors
                                .white,
                            shape: BoxShape
                                .circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius:
                                      30,
                                  offset: Offset(
                                      -5,
                                      -5),
                                  color:
                                      Colors.white),
                              BoxShadow(
                                  blurRadius:
                                      30,
                                  offset: Offset(
                                      5,
                                      5),
                                  color: Colors
                                      .grey
                                      .shade300),
                            ]),
                        child: Padding(
                          padding:
                              EdgeInsets
                                  .only(),
                          child: Center(
                              child:
                                  Icon(
                            Icons
                                .shopping_bag_outlined,
                            size: 23,
                            color: Colors
                                .black,
                          )),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(),
            child: Container(
              width: _deviceWidth,
              height:
                  _deviceHeight * 0.785,
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceEvenly,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(
                            left: 0,
                            top: 0),
                    child: Container(
                      height:
                          _deviceHeight /
                              3.8,
                      width:
                          _deviceWidth *
                              0.92,
                      decoration: BoxDecoration(
                          color: Colors
                              .white,
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius:
                                    10,
                                offset: Offset(
                                    -5,
                                    -5),
                                color: Colors
                                    .grey
                                    .shade300),
                            BoxShadow(
                                blurRadius:
                                    10,
                                offset: Offset(
                                    5,
                                    5),
                                color: Colors
                                    .grey
                                    .shade300),
                          ]),
                      child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap:
                                  () {
                                    ScaffoldMessenger
                                        .of(
                                        context)
                                        .showSnackBar(snakbarBuild(
                                       "Available In Next Update",
                                        _deviceWidth,
                                        context));

                                // profilePicture();
                              },
                              child:
                                  Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        10,
                                    top:
                                        0),
                                child:
                                    Container(
                                  height:
                                      _deviceHeight / 10,
                                  width:
                                      _deviceWidth / 4,
                                  decoration:
                                      BoxDecoration(
                                    shape:
                                        BoxShape.circle,
                                    image:
                                        DecorationImage(image: NetworkImage(user ? imageurl.toString() : "https://www.feedbackhall.com/uploads/user-icon.png"), fit: BoxFit.cover),
                                    color:
                                        Colors.white,
                                  ),
                                  child:
                                      Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                                        child: Center(
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 13,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        5,
                                    top:
                                        0),
                                child:
                                    Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      noUserName ? "User Name" : username.toString(),
                                      style: GoogleFonts.robotoMono(textStyle: TextStyle(fontSize: 24, letterSpacing: 0, fontWeight: FontWeight.w500, color: Colors.black)),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.only(left: 5),
                                    //   child: Container(
                                    //     width: 20,
                                    //     height: 20,
                                    //     decoration: BoxDecoration(
                                    //         color: Colors.orange[500],
                                    //         borderRadius:
                                    //             BorderRadius.circular(3)),
                                    //     child: Center(
                                    //       child: Icon(
                                    //         Icons.edit,
                                    //         color: Colors.white,
                                    //         size: 13,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                )),
                            Padding(
                                padding:
                                    EdgeInsets
                                        .only(),
                                child:
                                    Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      userEmail.toString(),
                                      style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 15, letterSpacing: 2, fontWeight: FontWeight.w400, color: Colors.grey.shade700)),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 1),
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(shape: BoxShape.circle),
                                          child: Center(
                                            child: Icon(
                                              Icons.verified,
                                              color: Colors.green,
                                              size: 20,
                                            ),
                                          ),
                                        ))
                                  ],
                                ))
                          ]),
                    ),
                  ),
                  // Padding(
                  //     padding: EdgeInsets.only(left: 0),
                  //     child: settingsContainer(
                  //         "Edit profile",
                  //         _deviceWidth,
                  //         Colors.green.shade100,
                  //         Color(0xff25b32e),
                  //         Icons.person_2_outlined,
                  //         "/editProfile",
                  //         context)),
                  Padding(
                      padding: EdgeInsets
                          .only(
                              left: 0),
                      child: settingsContainer(
                          "Order history",
                          _deviceWidth,
                          Colors.purple
                              .shade100,
                          Colors.purple
                              .shade900,
                          Icons.history,
                          "/orderHistory",
                          context)),
                  Padding(
                      padding: EdgeInsets
                          .only(
                              left: 0),
                      child: settingsContainer(
                          "How it works",
                          _deviceWidth,
                          Colors.blue
                              .shade100,
                          Colors.blue
                              .shade900,
                          Icons
                              .work_outline,
                          "/howItWorks",
                          context)),
                  Padding(
                      padding: EdgeInsets
                          .only(
                              left: 0),
                      child: settingsContainer(
                          "Contact Us ",
                          _deviceWidth,
                          Colors.cyan
                              .shade100,
                          Colors.cyan
                              .shade900,
                          Icons
                              .contact_page_outlined,
                          "/contactUs",
                          context)),
                  Padding(
                      padding: EdgeInsets
                          .only(
                              left: 0),
                      child: settingsContainer(
                          "Developer Info",
                          _deviceWidth,
                          Colors.yellow
                              .shade100,
                          Color(
                              0xffff7700),
                          Icons.code,
                          "/developer",
                          context)),

                  // Padding(
                  //     padding: EdgeInsets.only(left: 0),
                  //     child: settingsContainer("Developer", _deviceWidth)),
                  GestureDetector(
                      onTap: () async {
                        showDialog(
                            context:
                                context,
                            useRootNavigator:
                                false,
                            builder:
                                (context) {
                              return Center(
                                  child:
                                      CircularProgressIndicator());
                            });
                        SharedPreferences
                            prefrences =
                            await SharedPreferences
                                .getInstance();
                        await prefrences
                            .remove(
                                "loggedIn");
                        await prefrences
                            .remove(
                                "email");
                        Provider.of<stateProvider>(
                                context,
                                listen:
                                    false)
                            .loggedIn = false;
                        Provider.of<stateProvider>(
                                context,
                                listen:
                                    false)
                            .setNavIndex(
                                0);
                        ScaffoldMessenger.of(
                                context)
                            .showSnackBar(snakbarBuild(
                                "loggedOutSuccessfully",
                                _deviceWidth,
                                context));
                        Navigator.of(
                                context)
                            .pop();
                      },
                      child: Padding(
                          padding: EdgeInsets
                              .only(
                                  left:
                                      0),
                          child:
                              Container(
                            width:
                                _deviceWidth /
                                    2.5,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(
                                        10),
                                color: Color(
                                    0xfffc2020)),
                            child: Center(
                                child: Text(
                              "Logout"
                                  .toUpperCase(),
                              style: GoogleFonts.rubik(
                                  textStyle: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w500)),
                            )),
                          ))),
                ],
              ),
            ))
      ],
    ));
  }
}

Widget settingsContainer(
    String name,
    dynamic width,
    Color back,
    Color fore,
    IconData icon,
    String route,
    dynamic context) {
  return Container(
    height: 50,
    width: width * 0.92,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: Offset(-5, -5),
              color:
                  Colors.grey.shade300),
          BoxShadow(
              blurRadius: 10,
              offset: Offset(5, 5),
              color:
                  Colors.grey.shade300),
        ]),
    child: Row(
      mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,
      children: [
        Padding(
            padding: EdgeInsets.only(
                left: 10),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: back,
                  borderRadius:
                      BorderRadius
                          .circular(
                              10)),
              child: Center(
                child: Icon(
                  icon,
                  size: 25,
                  color: fore,
                ),
              ),
            )),
        Padding(
          padding:
              EdgeInsets.only(left: 20),
          child: Text(name,
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight
                              .w400,
                      color: Colors
                          .black))),
        ),
        GestureDetector(
          onTap: () {
            Navigator
                .pushReplacementNamed(
                    context, route);
          },
          child: Padding(
            padding: EdgeInsets.only(
                right: 10),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: Offset(
                            -5, -5),
                        color: Colors
                            .grey
                            .shade300),
                    BoxShadow(
                        blurRadius: 10,
                        offset: Offset(
                            5, 5),
                        color: Colors
                            .grey
                            .shade300),
                  ],
                  color: Colors
                      .yellow[700],
                  borderRadius:
                      BorderRadius
                          .circular(
                              10)),
              child: Center(
                  child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 20,
              )),
            ),
          ),
        )
      ],
    ),
  );
}


snakbarBuild(
    String message,
    dynamic deviceWidth,
    dynamic context) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 2),
    elevation: 0,
    backgroundColor: Colors.transparent
        .withOpacity(0),
    content: Container(
        padding:
        const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius:
          BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 10),
              child: Text(
                "$message",
                style: GoogleFonts
                    .inconsolata(
                    color: Color(
                        0xff000000),
                    letterSpacing:
                    1.2,
                    fontSize: 18,
                    fontWeight:
                    FontWeight
                        .w600),
              ),
            ),
            Padding(
                padding:
                EdgeInsets.only(
                    right: 10),
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger
                        .of(context)
                        .hideCurrentSnackBar();
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape
                            .circle,
                        color: Colors
                            .yellow[
                        700]),
                    child: Icon(
                      Icons.close,
                      color:
                      Colors.black,
                      size: 22,
                    ),
                  ),
                ))
          ],
        )),
  );
}
