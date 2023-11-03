import 'package:google_sign_in/google_sign_in.dart';

import '../../../helper/server/getUser.dart';
import '../../../state/stateProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/loginTextField.dart';
import '../../utils/passwordTextField.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key})
      : super(key: key);

  @override
  State<loginPage> createState() =>
      _loginPageState();
}

class _loginPageState
    extends State<loginPage> {
  dynamic googleUserInfo;


  dynamic googleSignIN()async{
    final GoogleSignInAccount? gUser
    = await  GoogleSignIn().signIn()
        .then((value){
      setState(() {

        googleUserInfo = value!;
      });
    });
    if(gUser != null){
      final
      GoogleSignInAuthentication
      gAuth = await gUser
          .authentication;
      final AuthCredential credential =
      GoogleAuthProvider.credential(
          accessToken:gAuth.accessToken,
          idToken: gAuth.idToken
      );
      try{
        final UserCredential
        userCredential = await
        FirebaseAuth.instance.signInWithCredential(credential);
        return "success";
      }
      catch(e){
        return e.toString();
      }
    }
    else{
      return "success";
      // print(googleUserInfo.email);
      // print(googleUserInfo.displayName);
    }
  }
  Future<SharedPreferences> prefs =
      SharedPreferences.getInstance();
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
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: _deviceWidth,
            height:
                _deviceHeight * 0.87,
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceEvenly,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(
                          top: 0),
                  child: Container(
                      width:
                          _deviceWidth,
                      height: _deviceHeight /
                          3.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "images/loginBg.png"),
                              fit: BoxFit
                                  .fitHeight))),
                ),
                Padding(
                    padding:
                        EdgeInsets.only(
                            top: 0,
                            bottom:5),
                    child: Container(
                        child: Center(
                      child: Text(
                          "Welcome back",
                          style: GoogleFonts.inconsolata(
                              textStyle: TextStyle(
                                  color: Colors
                                      .black,
                                  fontSize:
                                      40,
                                  fontWeight:
                                      FontWeight.w600))),
                    ))),
                Padding(
                    padding: EdgeInsets
                        .only(),
                    child:
                        loginTextField()),
                Padding(
                  padding:
                      EdgeInsets.only
                        (top:5),
                  child:
                      passwordTextField(),
                ),
                Padding(
                    padding:
                        EdgeInsets.only(
                            right: 30),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .end,
                      children: [
                        Container(
                          child: Text(
                              "Reset passowrd?",
                              style: GoogleFonts.robotoMono(
                                  textStyle: TextStyle(
                                      color: Color.fromARGB(255, 255, 51, 0),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500))),
                        )
                      ],
                    )),
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
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: Provider.of<
                                      stateProvider>(
                                  context,
                                  listen:
                                      false)
                              .loginEmail
                              .text,
                          password: Provider.of<
                                      stateProvider>(
                                  context,
                                  listen:
                                      false)
                              .loginPassword
                              .text);
                      Provider.of<stateProvider>(
                          context,
                          listen:
                          false)
                          .userData = await getUser(
                          email:
                          Provider.of<stateProvider>(
                              context,
                              listen:
                              false)
                              .loginEmail
                              .text)
                          .findUser();

                      setState(() {
                        prefs.then(
                                (pref) {
                              pref.setBool(
                                  "loggedIn",
                                  true);
                              pref.setString(
                                  "email",
                                  Provider.of<stateProvider>(
                                      context,
                                      listen: false)
                                      .loginEmail
                                      .text);


                            },
                            onError:
                                (error) {});


                        Provider.of<stateProvider>(
                            context,
                            listen:
                            false)
                            .loggedIn = true;


                      });



                      Provider.of<stateProvider>(
                          context,
                          listen:
                          false)
                          .loginPassword
                          .clear();
                      Provider.of<stateProvider>(
                          context,
                          listen:
                          false)
                          .loginEmail.clear();
                      Provider.of<stateProvider>(
                              context,
                              listen:
                                  false)
                          .setNavIndex(
                              0);
                      ScaffoldMessenger
                              .of(
                                  context)
                          .showSnackBar(snakbarBuild(
                              "loggedIn",
                              _deviceWidth,
                              context));



                      // dynamic a = getUser(email:).findUser();
                    } on FirebaseAuthException catch (e) {
                      if (e.code ==
                          "invalid-email") {
                        ScaffoldMessenger.of(
                                context)
                            .showSnackBar(snakbarBuild(
                                "invalidEmail",
                                _deviceWidth,
                                context));
                      } else if (e
                              .code ==
                          "wrong-password") {
                        ScaffoldMessenger.of(
                                context)
                            .showSnackBar(snakbarBuild(
                                "wrongPassword",
                                _deviceWidth,
                                context));
                      } else if (e
                              .code ==
                          "user-not-found") {
                        ScaffoldMessenger.of(
                                context)
                            .showSnackBar(snakbarBuild(
                                "userNotFound",
                                _deviceWidth,
                                context));
                      } else if (e
                              .code ==
                          "too-many-requests") {
                        ScaffoldMessenger.of(
                                context)
                            .showSnackBar(snakbarBuild(
                                "tooManyAttempts",
                                _deviceWidth,
                                context));
                      } else if (e
                              .code ==
                          "channel-error") {
                        ScaffoldMessenger.of(
                                context)
                            .showSnackBar(snakbarBuild(
                                "wrongInput",
                                _deviceWidth,
                                context));
                      } else {
                        ScaffoldMessenger.of(
                                context)
                            .showSnackBar(snakbarBuild(
                                e.code,
                                _deviceWidth,
                                context));
                      }
                    } catch (e) {
                      print(e);
                      ScaffoldMessenger
                              .of(
                                  context)
                          .showSnackBar(snakbarBuild(
                              e.toString(),
                              _deviceWidth,
                              context));
                    }
                    Navigator.of(
                            context)
                        .pop();
                  },
                  child: Padding(
                      padding: EdgeInsets
                          .only(
                              top: 0,
                              bottom:
                                  10),
                      child: Container(
                          width:
                              _deviceWidth /
                                  1.5,
                          height: 50,
                          decoration:
                              BoxDecoration(
                            color: Colors
                                    .yellow[
                                700],
                            borderRadius:
                                BorderRadius.circular(
                                    10),
                          ),
                          child: Center(
                            child: Text(
                              "Login In",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ))),
                ),
                Container(
                  width: _deviceWidth *
                      0.8,
                  height: 20,
                  child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                      children: [
                        Container(
                          width:
                              _deviceWidth /
                                  4,
                          height:
                              _deviceHeight /
                                  400,
                          decoration: BoxDecoration(
                              color: Colors
                                  .grey
                                  .shade100),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left:
                                    10,
                                right:
                                    10),
                            child:
                                Center(
                              child:
                                  Text(
                                "OR",
                                style: TextStyle(
                                    color:
                                        Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        Container(
                          width:
                              _deviceWidth /
                                  4,
                          height:
                              _deviceHeight /
                                  400,
                          decoration: BoxDecoration(
                              color: Colors
                                  .grey
                                  .shade100),
                        ),
                      ]),
                ),
                Padding(
                    padding: EdgeInsets
                        .only(),
                    child:
                       GestureDetector(
                         onTap:()async{
                           dynamic
                           googleUser
                           =
                           await
                           googleSignIN();

                           dynamic
                           getuser =
                           await getUser(
                               email:googleUserInfo.email)
                               .findUser();
                           print
                             ("-----------------------------");
                           print
                             (
                               await
                               getuser);
                           print
                             ("-----------------------------");
                           if
                           (getuser
                           != "userNotFound"){
                             if
                             (googleUser == "success"){
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
                               try {
                                 dynamic userdata =  await getUser(
                                     email:googleUserInfo.email)
                                     .findUser();
                                 if
                                 (userdata != "userNotFound" ||
                                     userdata != "ProvideCorrectEmail" ||
                                     userdata != "someThingWentWrong"  ){
                                   Provider.of<stateProvider>(
                                       context,
                                       listen:
                                       false)
                                       .userData = await getUser(
                                       email:googleUserInfo.email)
                                       .findUser();
                                   print(googleUserInfo.email);
                                   setState(() {
                                     prefs.then(
                                             (pref) {
                                           pref.setBool(
                                               "loggedIn",
                                               true);
                                           pref.setString(
                                               "email",
                                               googleUserInfo.email);
                                           print("_______________");
                                           print(googleUserInfo.email);
                                           print("__________________");

                                         },
                                         onError:
                                             (error) {});

                                     Provider.of<stateProvider>(
                                         context,
                                         listen:
                                         false)
                                         .loggedIn = true;
                                   });
                                   Provider.of<stateProvider>(
                                       context,
                                       listen:
                                       false)
                                       .setNavIndex(
                                       0);

                                 }
                                 else{
                                   ScaffoldMessenger
                                       .of(
                                       context)
                                       .showSnackBar(snakbarBuild(
                                       "error",
                                       _deviceWidth,
                                       context));
                                 }


                               } catch (e) {
                                 print(e);
                                 ScaffoldMessenger
                                     .of(
                                     context)
                                     .showSnackBar(snakbarBuild(
                                     e.toString(),
                                     _deviceWidth,
                                     context));
                               }


                               Navigator.of(context).pop();
                             }
                             else{
                               ScaffoldMessenger
                                   .of(
                                   context)
                                   .showSnackBar(snakbarBuild(
                                   "serverError",
                                   _deviceWidth,
                                   context));

                             }
                           }
                           else{
                             ScaffoldMessenger
                                 .of(
                                 context)
                                 .showSnackBar(snakbarBuild(
                                 "use"
                                     "rNotFound",
                                 _deviceWidth,
                                 context));

                           }


                         },
                         child:  Padding(
                           padding: EdgeInsets
                               .only(
                               right:
                               0),
                           child:
                           Container(
                             width:
                             _deviceWidth / 1.5,
                             decoration: BoxDecoration(
                               color:Colors.white,
                               borderRadius: BorderRadius.circular(10),
                               boxShadow: [
                                 BoxShadow(
                                   blurRadius:10,
                                   offset: Offset(-5,-5),
                                   color:Colors.grey.shade200
                                 ),
                                 BoxShadow(
                                     blurRadius:10,
                                     offset: Offset(5,5),
                                     color:Colors.grey.shade400
                                 ),

                               ]
                             ),

                             height: 50,
                             child:Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Padding(
                                   padding:EdgeInsets.only(),
                                   child:Container(
                                     width:40,
                                     height:40,
                                     decoration: BoxDecoration(
                                         color:Colors.white,
                                         image: DecorationImage(
                                             image:
                                             NetworkImage("https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png"),
                                             fit: BoxFit.cover)),
                                   ),
                                 ),
                                 Padding(padding:EdgeInsets.only(),
                                   child:Center(
                                     child:Text(
                                       "Sign In Using Google",
                                       style:GoogleFonts.roboto(
                                         textStyle:TextStyle(
                                           color:Colors.black,
                                           fontSize:15,
                                           fontWeight:FontWeight.w400,
                                           letterSpacing:2

                                         )
                                       )
                                     )
                                   ),

                                 )
                               ],
                             ),

                           ),
                         ),
                       ),
                       ),
                Padding(
                  padding:
                      EdgeInsets.only(
                          left: 20,
                          top:10),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .center,
                    mainAxisAlignment:
                        MainAxisAlignment
                            .center,
                    children: [
                      Text(
                          "Don't have Acoount ? ",
                          style: GoogleFonts.rajdhani(
                              textStyle: TextStyle(
                                  color: Colors
                                      .grey
                                      .shade700,
                                  fontSize:
                                      15,
                                  fontWeight:
                                      FontWeight.w300))),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context,
                                "/signUp");
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      10),
                              child: Text(
                                  "Sign Up",
                                  style:
                                      GoogleFonts.rubik(textStyle: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w600)))))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
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
