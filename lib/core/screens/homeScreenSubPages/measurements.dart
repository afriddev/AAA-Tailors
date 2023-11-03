import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/cachedImage.dart';
import 'package:provider/provider.dart';

import '../../../state/stateProvider.dart';

class measurements extends StatefulWidget {
  const measurements({Key? key}) : super(key: key);

  @override
  State<measurements> createState() => _measurementsState();
}

class _measurementsState extends State<measurements> {
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Navigator.pushReplacementNamed(context, "/homePage");
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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Container(
                  width: _deviceWidth * 0.97,
                  height: _deviceHeight * 0.25,
                  child: cachedImage(
                      imageUrl:
                          "https://i.ibb.co/z4CBvss/measurements-main.png",
                      borderRadius: 0),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                    child: Text(
                      "Preparing for the Perfect Shot with Smart Measurements",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2,
                              color: Colors.black)),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 5, right: 10, left: 15),
                  child: Text(
                    "Before you get started with the photo shoot, make sure you’re well prepared. Wear something tight-fitting like a bodysuit or leggings and a tank top.",
                    style: GoogleFonts.robotoMono(
                        textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade800,
                            letterSpacing: 1)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "Strike a Pose",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                            color: Colors.pink)),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Container(
                      width: _deviceWidth * 0.8,
                      height: _deviceHeight * 0.7,
                      child: cachedImage(
                          imageUrl:
                              "https://i.ibb.co/fn3VdRT/pose1.jpg",
                          borderRadius: 0),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "Say Cheese (Twice)",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                            color: Colors.pink)),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Container(
                      width: _deviceWidth * 0.8,
                      height: _deviceHeight * 0.7,
                      child: cachedImage(
                          imageUrl:
                              "https://i.ibb.co/4Frgjr4/pose2.jpg",
                          borderRadius: 0),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "Voila, We’ve Got Your Measurements!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                            color: Colors.pink)),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Container(
                      width: _deviceWidth * 0.95,
                      height: _deviceHeight * 0.5,
                      child: cachedImage(
                          imageUrl:
                              "https://i.ibb.co/BtJPdFK/gotposes.jpg",
                          borderRadius: 10),
                    )),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
