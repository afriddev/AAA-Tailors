import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../state/stateProvider.dart';

class seeGuide extends StatefulWidget {
  const seeGuide({Key? key}) : super(key: key);

  @override
  State<seeGuide> createState() => _seeGuideState();
}

class _seeGuideState extends State<seeGuide> {
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
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
                          Navigator.pushReplacementNamed(
                              context, "/productInfo");
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
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.only(),
              child: Container(
                width: _deviceWidth,
                height: _deviceHeight * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://i.ibb.co/71SXSPc/guide.webp"))),
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.only(),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'How does online tailoring with Ameerunisa work?',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.pink,
                                letterSpacing: 2,
                                fontSize: 25,
                                fontWeight: FontWeight.w500)),
                      )),
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Text(
                        "Once you place an order with us, we'll schedule a pickup of your fabric from your home. If you don’t have fabric, you can ask us to find it for you.Next, You can choose to speak with us on video call or have to visit your home. we'll stitch the garment & ship it to your home in 3-7 working days.Alterations, if any, are taken care of free of charge.",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w300)),
                      )),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          //
          //
          Padding(
              padding: EdgeInsets.only(),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'How will you take my measurements?',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.pink,
                                letterSpacing: 2,
                                fontSize: 25,
                                fontWeight: FontWeight.w500)),
                      )),
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Text(
                        "Once you place an order with us, Our fashion designer will assist you with the process.If our designer is visiting your home, they’ll take your Smart Measurements.",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1.5,
                                fontSize: 14,
                                fontWeight: FontWeight.w300)),
                      )),
                ],
              )),
          SizedBox(
            height: 20,
          ),

          //
          //
          //
          Padding(
              padding: EdgeInsets.only(),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'Do you help with designing the outfit?',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.pink,
                                letterSpacing: 2,
                                fontSize: 25,
                                fontWeight: FontWeight.w500)),
                      )),
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Text(
                        "Yes. When you place a stitching order with us, we pair you up with a fashion designer who will help design a look for your outfit. While you’re making this choice, she will also help you understand what kind of designs might suit your body type.",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1.5,
                                fontSize: 14,
                                fontWeight: FontWeight.w300)),
                      )),
                ],
              )),
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.only(),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'What kind of clothes do you stitch?',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.pink,
                                letterSpacing: 2,
                                fontSize: 25,
                                fontWeight: FontWeight.w500)),
                      )),
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Text(
                        "We stitch all types of women's clothing, both ethnic & western. The categories we service include saree blouses, salwar kameez, lehengas, dresses, gowns, trousers and shirts, among other things. We also provide finishing services like saree fall addition, pico (zigzag), hemming & saree kuchu (tassel addition).",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1.5,
                                fontSize: 14,
                                fontWeight: FontWeight.w300)),
                      )),
                ],
              )),
          SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }
}
