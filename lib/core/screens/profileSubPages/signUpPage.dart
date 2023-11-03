import '../../../helper/fireBase/signUp'
    '/validate.dart';
import '../../../helper/server/addUser'
    '.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../state/stateProvider.dart';
import 'package:provider/provider.dart';
import '../../utils/otpField.dart';
import '../../utils/passwordField.dart';
import '../../utils/userEmail.dart';
import '../../utils/userName.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({Key? key}) : super(key: key);
  @override
  State<signUpPage> createState() => _signUpPageState();
}
class _signUpPageState extends State<signUpPage> {
  dynamic googleUserInfo;

  dynamic googleSignUP()async{
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
  int signUpProcess = 0;
  dynamic sendedOtp;
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: _deviceWidth,
            height: _deviceHeight * 0.87,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Container(
                    width: _deviceWidth,
                    height: _deviceHeight / 4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://safekaro.com/images/login.png"),
                            fit: BoxFit.fitHeight)),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                    child: Container(
                        child: Center(
                      child: Text("Create account",
                          style: GoogleFonts.inconsolata(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600))),
                    ))),
                Padding(
                  padding: EdgeInsets.only(),
                  child: signUpProcess == 0
                      ? Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: userName()),
                            Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: userEmail()),
                            //Padding(padding: EdgeInsets.only(top: 10), child: userOtpField()),
                          ],
                        )
                      : signUpProcess == 1
                          ? Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: passwordField(
                                      hintText: "Enter Passwrod",
                                      eye: false,
                                      controller: Provider.of<stateProvider>(
                                              context,
                                              listen: false)
                                          .password1,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: passwordField(
                                      hintText: "Re Enter Password",
                                      eye: true,
                                      controller: Provider.of<stateProvider>(
                                              context,
                                              listen: false)
                                          .password2,
                                    )),
                              ],
                            )
                          : Column(
                              children: [SizedBox(height: 20), otpField()],
                            ),
                ),
                GestureDetector(
                  onTap: () async {

                    if (signUpProcess == 0) {
                      showDialog(context: context,
                          useRootNavigator: false,
                          builder:(context){
                            return Center(child:CircularProgressIndicator());});
                      setState(() {
                        dynamic check = validate().step1(
                            Provider.of<stateProvider>(context, listen: false)
                                .userName
                                .text,
                            Provider.of<stateProvider>(context, listen: false)
                                .email
                                .text);
                        if (check == "step1success") {
                          signUpProcess++;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              snakbarBuild(check, _deviceWidth, context));
                        }
                      });
                      Navigator.of
                        (context).pop();
                    } else if (signUpProcess == 1) {
                      showDialog(context: context,
                          useRootNavigator: false,
                          builder:(context){
                            return Center(child:CircularProgressIndicator());});


                      dynamic check = await validate().step2(
                        Provider.of<stateProvider>(context, listen: false)
                            .password1
                            .text,
                        Provider.of<stateProvider>(context, listen: false)
                            .password2
                            .text,
                        Provider.of<stateProvider>(context, listen: false)
                            .email
                            .text,
                      );
                      if (check.length == 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            snakbarBuild("emailSent", _deviceWidth, context));
                        setState(() {
                          sendedOtp = check;
                          signUpProcess++;
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            snakbarBuild(check, _deviceWidth, context));
                      }
                      Navigator
                          .of
                        (context).pop();
                    } else {
                      showDialog(context: context,
                          useRootNavigator: false,
                          builder:(context){
                            return Center(child:CircularProgressIndicator());});

                      bool validateEmail = validate().checkOtp(
                          Provider.of<stateProvider>(
                            context,
                            listen: false,
                          ).otp.text,
                          sendedOtp);
                      if (validateEmail) {
                        try {
                          dynamic adduser = await addUser(
                              userName: Provider.of<stateProvider>(context,
                                      listen: false)
                                  .userName
                                  .text,
                              email: Provider.of<stateProvider>(context,
                                      listen: false)
                                  .email
                                  .text);
                          dynamic serverResponse = await adduser.add();
                          if (serverResponse == "userCreated") {
                            try {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: Provider.of<stateProvider>(context,
                                              listen: false)
                                          .email
                                          .text,
                                      password: Provider.of<stateProvider>(
                                              context,
                                              listen: false)
                                          .password1
                                          .text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snakbarBuild("userCreatedSuccessfully",
                                      _deviceWidth, context));
                              Navigator.pushReplacementNamed(context, "/login");
                            } on FirebaseAuthException catch (e) {
                              if (e.code == "wrong-password") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    snakbarBuild("invalidPassword",
                                        _deviceWidth, context));
                              } else if (e.code == "invalid-email") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    snakbarBuild(
                                        "invalidEmail", _deviceWidth, context));
                              } else if (e.code == "email-already-in-use") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    snakbarBuild("emailAlreadyExists",
                                        _deviceWidth, context));
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snakbarBuild("someThingWentWrong",
                                      _deviceWidth, context));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                snakbarBuild(
                                    serverResponse, _deviceWidth, context));
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              snakbarBuild(
                                  "someThingWentWrong", _deviceWidth, context));
                        }
                        // else if(serverResponse == "userAlreadyExists"){
                        //
                        // }
                        // else if(serverResponse == "giveCorrectData"){
                        //
                        // }
                        // else if(serverResponse == "someThingWentWrong"){
                        //
                        // }
                        //

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            snakbarBuild("wrongOtp", _deviceWidth, context));
                      }
                      Navigator.of
                        (context).pop();
                    }
                    Provider.of<stateProvider>(context,listen: false).userName.clear();
                    Provider.of<stateProvider>(context,listen: false).email.clear();
                    Provider.of<stateProvider>(context,listen: false).password1.clear();
                    Provider.of<stateProvider>(context,listen: false).password2.clear();
                    Provider.of<stateProvider>(context,listen: false).otp.clear();

                  },
                  child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 3),
                      child: Container(
                          width: _deviceWidth / 1.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.yellow[700],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              signUpProcess == 0
                                  ? "Next"
                                  : signUpProcess == 1
                                      ? "Send Otp"
                                      : "Sign Up",
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
                  width: _deviceWidth * 0.8,
                  height: 20,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: _deviceWidth / 4,
                          height: _deviceHeight / 400,
                          decoration:
                              BoxDecoration(color: Colors.grey.shade100),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Center(
                              child: Text(
                                "OR",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        Container(
                          width: _deviceWidth / 4,
                          height: _deviceHeight / 400,
                          decoration:
                              BoxDecoration(color: Colors.grey.shade100),
                        ),
                      ]),
                ),
                SizedBox(height: 0),
                Padding(
                    padding: EdgeInsets.only(),

                        child:GestureDetector(
                          onTap:()
                          async {
                            dynamic
                            responseFromGoogleSignUp =
                            await
                            googleSignUP();


                            if
                            (responseFromGoogleSignUp == "success"){
                              try {

                                dynamic adduser = await addUser(
                                  userName:googleUserInfo.displayName,
                                  email: googleUserInfo.email
                                );
                                dynamic serverResponse = await adduser.add();

                                if (serverResponse == "userCreated") {
                                  try {
                                    print
                                      ("-------------------------");
                                    print
                                      (serverResponse);
                                    print
                                      ("-------------------------");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        snakbarBuild("userCreatedSuccessfully",
                                            _deviceWidth, context));
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                        email: Provider.of<stateProvider>(context,
                                            listen: false)
                                            .email
                                            .text,
                                        password: Provider.of<stateProvider>(
                                            context,
                                            listen: false)
                                            .password1
                                            .text);

                                    Navigator.pushReplacementNamed(context, "/login");
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == "wrong-password") {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          snakbarBuild("invalidPassword",
                                              _deviceWidth, context));
                                    } else if (e.code == "invalid-email") {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          snakbarBuild(
                                              "invalidEmail", _deviceWidth, context));
                                    } else if (e.code == "email-already-in-use") {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          snakbarBuild("emailAlreadyExists",
                                              _deviceWidth, context));
                                    }
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        snakbarBuild("someThingWentWrong",
                                            _deviceWidth, context));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snakbarBuild(
                                          serverResponse, _deviceWidth, context));
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    snakbarBuild(
                                        "someThingWentWrong", _deviceWidth, context));
                              }



                            }
                            else{
                              print
                                (responseFromGoogleSignUp);

                            }

                },
                          child: Padding(
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
                                            "Sign Up Using Google",
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
                          )
                        ),
                        ),
                Padding(
                  padding: EdgeInsets
                      .only(left: 20, top: 10, bottom: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have Acoount ? ",
                          style: GoogleFonts.rajdhani(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300))),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/login");
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Login",
                                  style: GoogleFonts.rubik(
                                      textStyle: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)))))
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

snakbarBuild(String message, dynamic deviceWidth, dynamic context) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 2),
    elevation: 0,
    backgroundColor: Colors.transparent.withOpacity(0),
    content: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0),
              child: Text(
                "$message",
                style: GoogleFonts.inconsolata(
                    color: Color(0xff000000),
                    letterSpacing: 1.2,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.yellow[700]),
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                ))
          ],
        )),
  );
}
