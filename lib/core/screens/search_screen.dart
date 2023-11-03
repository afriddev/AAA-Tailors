import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/screens/searchPageData.dart';
import '../../state/stateProvider.dart';
import 'package:provider/provider.dart';

class searchPage extends StatefulWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  State<searchPage> createState() => _searchPageState();
}

List searchResults = [];

class _searchPageState extends State<searchPage> {
  bool isSearchEmpty = true;
  void search(dynamic value) {
    if (value == "") {
      setState(() {
        isSearchEmpty = true;
        searchResults.clear();
      });
    } else {
      if (allProducts
              .where((element) =>
                  element[0].toLowerCase().contains(value.toLowerCase()))
              .toList()
              .length >=
          1) {
        print(searchResults);
        setState(() {
          isSearchEmpty = false;
          searchResults = allProducts
              .where((element) =>
                  element[0].toLowerCase().contains(value.toLowerCase()))
              .toList();
          print(searchResults.length);
        });
      } else {
        setState(() {
          isSearchEmpty = false;
          searchResults.clear();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _deviceWidth = MediaQuery.of(context).size.width;
    final _deviceHeight = MediaQuery.of(context).size.height;
    var searchController =
        Provider.of<stateProvider>(context, listen: true).searchField;

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
                        Provider.of<stateProvider>(context, listen: false)
                            .setNavIndex(0);
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
          padding: EdgeInsets.only(right: 30, left: 20, top: 10),
          child: Text(
            textAlign: TextAlign.left,
            "Designs ready to deliver for you",
            style: GoogleFonts.workSans(
                textStyle:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
          ),
        ),
        SizedBox(
          height: 30,
        ),
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
                      blurRadius: 30,
                      color: Colors.white,
                      offset: Offset(-5, -5)),
                  BoxShadow(
                      blurRadius: 30,
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
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Container(
                        width: _deviceWidth * 0.6,
                        height: 50,
                        child: TextField(
                          autofocus: true,
                          controller: searchController,
                          onChanged: (value) {
                            search(value);
                          },
                          style: GoogleFonts.mukta(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Search Design ",
                              hintStyle: GoogleFonts.mukta(
                                  textStyle: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade600))),
                        ),
                      ),
                    ),
                  ],
                )),
                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: FaIcon(FontAwesomeIcons.sliders)),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
        (searchController.text == "" && searchResults.isEmpty)
            ? defaultSearchResult(context, _deviceWidth, _deviceHeight)
            : (!isSearchEmpty && searchResults.isEmpty)
                ? noProductsFound(_deviceWidth, _deviceHeight)
                : searchProducts(context, _deviceWidth, _deviceHeight)
      ],
    )));
  }

  Widget noProductsFound(_deviceWidth, _deviceHeight) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
              width: _deviceWidth * 0.9,
              height: _deviceHeight / 3.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://img.freepik.com/free-vector/no-data-concept-illustration_114360-536.jpg?w=360&t=st=1691605203~exp=1691605803~hmac=521046a2537ea849987aed28370b3d5e8f27ebfb122b3e9380ed1e0c60419433"),
                      fit: BoxFit.fitHeight))),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.all(0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "No Matching Items Found",
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700)),
            ),
          ]),
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 30),
          child: Text(
            textAlign: TextAlign.center,
            "Apologies, no results found for your search. Please try again.",
            style: GoogleFonts.oxygen(
                textStyle:
                    TextStyle(color: Colors.grey.shade700, fontSize: 15)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                Provider.of<stateProvider>(context, listen: false)
                    .searchField
                    .clear();
              });
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  height: 50,
                  width: _deviceWidth / 2.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow[700]),
                  child: Center(
                      child: Text(
                    "Retry",
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w400)),
                  ))),
            ))
      ],
    );
  }
}

Widget searchProducts(context, _deviceWidth, _deviceHeight) {
  print(searchResults);
  return Padding(
      padding: EdgeInsets.only(),
      child: SizedBox(
          child: GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.4),
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              crossAxisCount: 2,
              children: List.generate(
                  searchResults.length,
                  (index) => Padding(
                      padding: EdgeInsets.only(left: 0, right: 10),
                      child: productContainer(
                        _deviceWidth,
                        _deviceHeight,
                        searchResults[index][1],
                        searchResults[index][0],
                        searchResults[index][3],
                        searchResults[index][2],
                        context,
                        searchResults[index][4],
                        searchResults[index][5],
                        searchResults[index][6],
                      ))))));
}

Widget defaultSearchResult(context, _deviceWidth, _deviceHeight) {
  return Padding(
      padding: EdgeInsets.only(),
      child: SizedBox(
          child: GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.4),
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              crossAxisCount: 2,
              children: List.generate(
                  defaultProducts.length,
                  (index) => Padding(
                      padding: EdgeInsets.only(left: 0, right: 10),
                      child: productContainer(
                        _deviceWidth,
                        _deviceHeight,
                        defaultProducts[index][1],
                        defaultProducts[index][0],
                        defaultProducts[index][3],
                        defaultProducts[index][2],
                        context,
                        defaultProducts[index][4],
                        defaultProducts[index][5],
                        defaultProducts[index][6],
                      ))))));
}

Widget productContainer(_deviceWidth, _deviceHeight, image, title, price,
    image2, context, disc, rating, sod) {
  return Padding(
    padding: EdgeInsets.only(),
    child: Column(
      children: [
        Container(
          height: _deviceHeight / 3 * 0.6,
          width: _deviceWidth * 0.45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(image))),
        ),
        Container(
            width: _deviceWidth * 0.45,
            height: _deviceHeight * 0.3 * 0.5,
            child: Padding(
              padding: EdgeInsets.only(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisAlignment: MainAxisAlignment.,

                children: [
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Text(title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            // letterSpacing: 2,
                            fontSize: 15,
                            color: Colors.pink,
                            fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 14, right: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Row(children: [
                              Icon(Icons.star,
                                  color: Colors.yellow[900], size: 20),
                              Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text(
                                    rating.toString(),
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            letterSpacing: 2,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)),
                                  )),
                            ]),
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 5, top: 3),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "₹",
                                      style: TextStyle(
                                        color: Color(0xffff0000),
                                        // fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(),
                                    child: Text(price.toString(),
                                        style: GoogleFonts.roboto(
                                            fontSize: 22,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.w400)),
                                  )
                                ],
                              ))
                        ],
                      )),
                  GestureDetector(
                      onTap: () {
                        List product = [
                          title,
                          image,
                          image2,
                          price,
                          disc,
                          rating,
                          sod
                        ];
                        Provider.of<stateProvider>(context, listen: false)
                            .selectedProduct
                            .insert(0, product);

                        Navigator.pushReplacementNamed(context, "/productInfo");
                      },
                      child: Padding(
                          padding: EdgeInsets.only(),
                          child: Container(
                              width: _deviceWidth * 0.3,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.pink,
                              )),
                              child: Center(
                                  child: Text("Get Now",
                                      style: GoogleFonts.robotoMono(
                                          fontSize: 15,
                                          color: Colors.pink,
                                          fontWeight: FontWeight.w500))))))
                ],
              ),
            ))
      ],
    ),
  );
}
