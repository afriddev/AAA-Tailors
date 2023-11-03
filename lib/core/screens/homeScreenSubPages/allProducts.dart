import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/bottomAllProducts.dart';
import 'package:provider/provider.dart';

import '../../../state/stateProvider.dart';
import '../homeScreenData.dart';

class allProducts extends StatefulWidget {
  const allProducts({Key? key}) : super(key: key);

  @override
  State<allProducts> createState() => _allProductsState();
}

class _allProductsState extends State<allProducts> {
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _deviceHeight = MediaQuery.of(context).size.height;

    ScrollController _scrollController = ScrollController();
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(children: [
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
                            context, "/productsPage");
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
          padding: EdgeInsets.only(top: 20),
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Find good 😎",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)))),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("design around you",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)))),
            ],
          )),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: 0, top: 0),
          child: Container(
            width: _deviceWidth * 0.93,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.white,
                      offset: Offset(-5, -5)),
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.shade300,
                      offset: Offset(5, 5)),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.search,
                        size: 28,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<stateProvider>(context, listen: false)
                            .setNavIndex(1);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Container(
                          width: _deviceWidth * 0.6,
                          height: 50,
                          child: TextField(
                            onTap: () {
                              Provider.of<stateProvider>(context, listen: false)
                                  .setNavIndex(1);
                            },
                            style: GoogleFonts.mukta(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                            decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: "Princess Cut Blouse",
                                hintStyle: GoogleFonts.mukta(
                                    textStyle: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade600))),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: FaIcon(FontAwesomeIcons.sliders)),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 50,
            child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: mainProductList.length,
                itemBuilder: (context, int index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (Provider.of<stateProvider>(context, listen: false)
                                  .buttonColor[index] ==
                              false) {
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
                              Provider.of<stateProvider>(context, listen: false)
                                  .buttonColor[index] = true;
                            }
                          } else {}
                          Provider.of<stateProvider>(context, listen: false)
                              .setSelectedSubProduct(index);
                        });
                      },
                      child: Container(
                        height: 50,
                        width: _deviceWidth * 0.33,
                        decoration: BoxDecoration(
                            color: Provider.of<stateProvider>(context,
                                        listen: true)
                                    .buttonColor[index]
                                ? Colors.pink
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          mainProductList[index][0],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              color: Provider.of<stateProvider>(context,
                                          listen: true)
                                      .buttonColor[index]
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 17,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    )))),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          child: bottomAllProducts(Products: allProductImages),
        )
      ]),
    ));
  }

  int bottomPhotoIndex = 1;
}
