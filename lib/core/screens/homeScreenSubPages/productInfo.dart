import '../../../helper/server/getUser'
    '.dart';
import '../../'
    '../helper/server/pushArray.dart';

import '../profileSubPages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../state/stateProvider.dart';
import 'package:provider/provider.dart';

class productInfo extends StatefulWidget {
  const productInfo({Key? key}) : super(key: key);

  @override
  State<productInfo> createState() => _productInfoState();
}

class _productInfoState extends State<productInfo> {
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _deviceHeight = MediaQuery.of(context).size.height;
    int selectedDays =
        Provider.of<stateProvider>(context, listen: true).selectedDays;
    return SafeArea(
        child: Container(
            width: _deviceWidth,
            height: _deviceHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    width: _deviceWidth,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: GestureDetector(
                              onTap: () {
                                for (int i = 0;
                                    i <
                                        Provider.of<stateProvider>(context,
                                                listen: false)
                                            .buttonColor
                                            .length;
                                    i++) {
                                  if (Provider.of<stateProvider>(context,
                                              listen: false)
                                          .buttonColor[i] ==
                                      true) {
                                    Provider.of<stateProvider>(context,
                                            listen: false)
                                        .buttonColor[i] = false;
                                  }
                                }

                                Provider.of<stateProvider>(context,
                                        listen: false)
                                    .buttonColor[0] = true;
                                Provider.of<stateProvider>(context,
                                        listen: false)
                                    .setSelectedSubProduct(0);

                                Navigator.pushReplacementNamed(
                                    context, "allProducts");
                                Provider.of<stateProvider>(context,
                                        listen: false)
                                    .selectedIndex = 1;
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade200,
                                        blurRadius: 10,
                                        offset: Offset(-5, -5)),
                                    BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 10,
                                        offset: Offset(5, 5)),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Center(
                                      child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 24,
                                    color: Colors.black,
                                  )),
                                ),
                              ),
                            )),
                        Container(
                          width: _deviceWidth * 0.6,
                          height: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("images/logo.png"))),
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<stateProvider>(context, listen: false)
                                .setNavIndex(2);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(right: 20, top: 15),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 30,
                                          offset: Offset(-5, -5),
                                          color: Colors.white),
                                      BoxShadow(
                                          blurRadius: 30,
                                          offset: Offset(5, 5),
                                          color: Colors.grey.shade300),
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.only(),
                                  child: Center(
                                      child: Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 23,
                                    color: Colors.black,
                                  )),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: _deviceWidth,
                  height: _deviceHeight * 0.785,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(),
                          child: Container(
                              width: _deviceWidth,
                              height: _deviceHeight / 2.7,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          Provider.of<stateProvider>(context,
                                                      listen: false)
                                                  .selectedProduct[0][
                                              Provider.of<stateProvider>(
                                                      context,
                                                      listen: true)
                                                  .selectedIndex])),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(),
                                          child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  Provider.of<stateProvider>(
                                                          context,
                                                          listen: false)
                                                      .selectedIndex = 1;
                                                });
                                              },
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        255, 247, 234, 0.2),
                                                    shape: BoxShape.circle),
                                                child: Padding(
                                                    padding: EdgeInsets.only(),
                                                    child: Center(
                                                        child: Icon(
                                                            Icons
                                                                .arrow_back_ios_new,
                                                            color:
                                                                Colors.white))),
                                              ))),
                                      Padding(
                                          padding: EdgeInsets.only(),
                                          child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  Provider.of<stateProvider>(
                                                          context,
                                                          listen: false)
                                                      .selectedIndex = 2;
                                                });
                                              },
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        255, 247, 234, 0.2),
                                                    shape: BoxShape.circle),
                                                child: Padding(
                                                    padding: EdgeInsets.only(),
                                                    child: Center(
                                                        child: Icon(
                                                            Icons
                                                                .arrow_forward_ios_rounded,
                                                            color:
                                                                Colors.white))),
                                              )))
                                    ],
                                  )))),
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  Provider.of<stateProvider>(context,
                                          listen: false)
                                      .selectedProduct[0][0],
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 27,
                                          fontWeight: FontWeight.w700))),
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(),
                                      child: Row(children: [
                                        Padding(
                                          padding: EdgeInsets.only(),
                                          child: Icon(
                                            Icons.star,
                                            size: 15,
                                            color: Colors.yellow[900],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            Provider.of<stateProvider>(context,
                                                        listen: false)
                                                    .selectedProduct[0][5] +
                                                "K  rating",
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 15,
                                            )),
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "+" +
                                            Provider.of<stateProvider>(context,
                                                    listen: false)
                                                .selectedProduct[0][6] +
                                            "K  reviews",
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 15,
                                        )),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "+" +
                                            (double.parse(Provider.of<
                                                                stateProvider>(
                                                            context,
                                                            listen: false)
                                                        .selectedProduct[0][6]) +
                                                    double.parse("1.5"))
                                                .toString() +
                                            "K  sold",
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 15,
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Description : ",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.5)),
                                )),
                            Padding(
                              padding: EdgeInsets.only(left: 18, right: 10),
                              child: Text(
                                  Provider.of<stateProvider>(context,
                                          listen: false)
                                      .selectedProduct[0][4],
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text(
                                    "How it works ?",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 2),
                                    ),
                                  )),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, "/seeGuide");
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              width: 1.5, color: Colors.pink),
                                        ),
                                      ),
                                      child: Text(
                                        "See Guide",
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.pink,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 2),
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: _deviceWidth * 0.025),
                          child: Container(
                              width: _deviceWidth * 0.95,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 15, top: 5),
                                          child: Text(
                                            "price",
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                    color: Colors.grey.shade300,
                                                    letterSpacing: 2,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Text(
                                            "₹ " +
                                                Provider.of<stateProvider>(
                                                        context,
                                                        listen: false)
                                                    .selectedProduct[0][3],
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing: 2,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        showDialog(context: context,
                                            useRootNavigator: false,
                                            builder:(context){
                                              return Center(child:CircularProgressIndicator());});
                                        SharedPreferences pref =
                                        await SharedPreferences
                                            .getInstance();
                                        bool loggedIn =
                                            await pref.getBool("loggedIn") ??
                                                false;
                                        if (loggedIn) {
                                          dynamic email = Provider.of<stateProvider>
                                            (context,listen:false).userData["email"];
                                          try {
                                            dynamic value = {
                                              "image":Provider.of<stateProvider>(context,listen:false).selectedProduct[0][1],
                                              "title":Provider.of<stateProvider>(context,listen:false).selectedProduct[0][0],
                                              "rating":Provider.of<stateProvider>(context,listen:false).selectedProduct[0][5],
                                              "price":Provider.of<stateProvider>(context,listen:false).selectedProduct[0][3],
                                            };
                                            dynamic response = await pushArray(
                                                email: email,
                                                value: value,
                                                key: "bagItems")
                                                .push();
                                            if (response == "pushSuccess") {
                                              dynamic response = await getUser(
                                                  email: email
                                              ).findUser();
                                              Provider.of<stateProvider>(context,listen:false).userData = response;
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snakbarBuild(
                                                  "addedSuccessfully",
                                                  _deviceWidth,
                                                  context));

                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snakbarBuild(
                                                  response,
                                                  _deviceWidth,
                                                  context));
                                            }
                                          } catch (e) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snakbarBuild(
                                                "someThingWentWrong",
                                                _deviceWidth,
                                                context));
                                          }
                                        } else {
                                          Provider.of<stateProvider>(context,
                                              listen: false)
                                              .setNavIndex(3);
                                        }
                                        Navigator.of(context).pop();

                                      },
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              right: 20, top: 10),
                                          child: Container(
                                            width: _deviceWidth * 0.4,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.yellow[700],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset: Offset(-5, -5),
                                                      color:
                                                          Colors.grey.shade900,
                                                      blurRadius: 10),
                                                  BoxShadow(
                                                      offset: Offset(5, 5),
                                                      color:
                                                          Colors.grey.shade900,
                                                      blurRadius: 10),
                                                ]),
                                            child: Center(
                                              child: Text(
                                                "Add to bag",
                                                style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        color: Colors.black,
                                                        letterSpacing: 2,
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                            ),
                                          )))
                                ],
                              )))
                    ],
                  ),
                )
              ],
            )));
  }
}
