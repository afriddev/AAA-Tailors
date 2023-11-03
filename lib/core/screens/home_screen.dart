import '../../helper/sendEmail/senMail'
    '.dart';
import '../../helper/server/getUser'
    '.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/cachedImage.dart';
import '../utils/loveProfileImagesSlider.dart';
import '../utils/productsSlider.dart';
import 'package:provider/provider.dart';

import '../../state/stateProvider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  bool image = true;
  dynamic imageUrl = "";
  var email ;

  Future<void> setUser() async {

    Future<SharedPreferences> prefs =
    SharedPreferences.getInstance();
    prefs.then(
            (pref) {

          setState(() {
            email = pref.getString
              ("email");
          });
        },
        onError:
            (error) {});
    if(email == null){

    }
    else{
      print("---------email ------");
      print(email);
      print("--------email-------");


      Provider.of<stateProvider>(
          context,
          listen:
          false)
          .userData = await getUser(
          email:email)
          .findUser();

    }



  }

  @override
  void initState() {
    super.initState();
    setState(() {
      setUser();
      dynamic a = Provider.of<stateProvider>(context,listen:false).userData;
      try{
        if(a == null ){
          image = true;
        }
        else{
          if(a['image'] == "" ||
              a['image'] == null)
            {
              image = true;

            }
          else{
            image = false;
            imageUrl = a['image'];

          }


        }
      }
      catch(e){
        print(e);
        image = true;

      }


    });
  }
  @override
  Widget build(BuildContext context) {
    final _deviceWidth = MediaQuery.of(context).size.width;
    final _deviceHeihgt = MediaQuery.of(context).size.height;

    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(),
                    child: Container(
                      width: _deviceWidth * 0.95,
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Provider.of<stateProvider>(context,
                                        listen: false)
                                    .setNavIndex(3);
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(image
                                            ? "https://www.feedbackhall.com/uploads/user-icon.png"
                                            :imageUrl.toString()
                                        ),
                                        fit: BoxFit.cover),
                                    shape: BoxShape.circle),
                              ),
                            ),

                            Container(
                                width: _deviceWidth * 0.6,
                                height: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:AssetImage("images/logo.png")
                                  )
                                ),
                            ),

                            // Container(
                            //     width: _deviceWidth * 0.6,
                            //     height: 50,
                            //     decoration: BoxDecoration(),
                            //     child: cachedImage(
                            //         borderRadius: 0,
                            //         imageUrl:
                            //             "https://raw.githubusercontent.com/afrid17/appImages/main/images/logo.png")),
                            //
                            Container(
                              height: 50,
                              child: Row(children: [
                                GestureDetector(
                                  onTap: () {
                                    Provider.of<stateProvider>(context,
                                            listen: false)
                                        .setNavIndex(2);
                                  },
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(right: 7, top: 20),
                                      child: Icon(Icons.shopping_bag_outlined,
                                          color: Colors.black, size: 27)),
                                )
                              ]),
                            )
                          ]),
                    ))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: 0, top: 20),
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
                              onTap: () {
                                Provider.of<stateProvider>(context,
                                        listen: false)
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
                      ],
                    )),
                    Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: FaIcon(FontAwesomeIcons.sliders)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Container(
              width: _deviceWidth,
              height: _deviceHeihgt * 0.16,
              child: cachedImage(
                imageUrl:
                    "https://i.ibb.co/PhPPm87/main-banner.jpg",
                borderRadius: 0,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.only(),
              child: Column(
                children: [
                  Container(
                    width: _deviceWidth * 0.95,
                    height: _deviceHeihgt * 0.15,
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-5, -5),
                              color: Colors.grey.shade100,
                              blurRadius: 10),
                          BoxShadow(
                              offset: Offset(5, 5),
                              color: Colors.grey.shade400,
                              blurRadius: 10),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(),
                            child: Text("Have a Fabric That You Want to",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w400)))),
                        GestureDetector(
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

                            Provider.of<stateProvider>(context, listen: false)
                                .buttonColor[0] = true;
                            Provider.of<stateProvider>(context, listen: false)
                                .setSelectedSubProduct(0);

                            Navigator.pushReplacementNamed(
                                context, "allProducts");
                          },
                          child: Padding(
                              padding: EdgeInsets.only(),
                              child: Container(
                                  width: _deviceWidth * 0.5,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(-5, -5),
                                            blurRadius: 10,
                                            color: Colors.grey.shade200),
                                        BoxShadow(
                                            offset: Offset(5, 5),
                                            blurRadius: 10,
                                            color: Colors.grey.shade400),
                                      ],
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text("Get stiched",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.w500))),
                                  ))),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(height: 30),
          Padding(
              padding: EdgeInsets.only(),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(),
                              child: Text(
                                "Category",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w500)),
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, "/productsPage");
                            },
                            child: Padding(
                                padding: EdgeInsets.only(),
                                child: Container(
                                    height: 30,
                                    width: _deviceWidth * 0.25,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(-5, -5),
                                              blurRadius: 10,
                                              color: Colors.grey.shade200),
                                          BoxShadow(
                                              offset: Offset(5, 5),
                                              blurRadius: 10,
                                              color: Colors.grey.shade400),
                                        ],
                                        color: Colors.yellow[700],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text(
                                      "See all",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              letterSpacing: 1.5,
                                              fontWeight: FontWeight.w400)),
                                    )))),
                          )
                        ],
                      )),
                  SizedBox(height: 15),
                  productsSlider(),
                ],
              )),
          SizedBox(height: 20),
          pinkLine(_deviceWidth),
          SizedBox(height: 20),
          Container(
              width: _deviceWidth,
              height: _deviceHeihgt * 0.35,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffffe2ed), Colors.white]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      "What makes us truly unique",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              letterSpacing: 2,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 22)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: _deviceWidth * 0.3,
                          height: _deviceHeihgt * 0.29,
                          child: Column(
                            children: [
                              Container(
                                width: _deviceWidth * 0.3,
                                height: _deviceHeihgt * 0.28 * 0.5,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://i.ibb.co/dD2B0Qy/unique1.webp"))),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    "Designer",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 0, left: 5, right: 5),
                                  child: Text(
                                    "Experience the luxury of your very own fashion designer.",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.robotoMono(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400)),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: _deviceWidth * 0.3,
                          height: _deviceHeihgt * 0.29,
                          child: Column(
                            children: [
                              Container(
                                width: _deviceWidth * 0.3,
                                height: _deviceHeihgt * 0.28 * 0.5,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://i.ibb.co/cbzjdB7/unique2.webp"))),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text(
                                    "Size ‘U’",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 0, left: 5, right: 5),
                                  child: Text(
                                    "Get fashion tailor-made for your unique body & size.",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.robotoMono(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400)),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: _deviceWidth * 0.3,
                          height: _deviceHeihgt * 0.28,
                          child: Column(
                            children: [
                              Container(
                                width: _deviceWidth * 0.3,
                                height: _deviceHeihgt * 0.28 * 0.5,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://i.ibb.co/3k1Y8M2/unique3.webp"))),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text(
                                    "Your vision",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 0, left: 5, right: 5),
                                  child: Text(
                                    "Enjoy the freedom to personalise your outfits.",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.robotoMono(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400)),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          pinkLine(_deviceWidth),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(),
                    child: Text("Book an appointment",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontSize: 25,
                                wordSpacing: 1.7,
                                fontWeight: FontWeight.w400)))),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Container(
                      width: _deviceWidth * 0.8,
                      height: 1,
                      decoration: BoxDecoration(color: Colors.grey.shade200)),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: Text(
                        "Upon receiving your booking request, we will contact you within an hour to confirm your details and to find a suitable time for your fitting.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoMono(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                wordSpacing: 1.7,
                                fontWeight: FontWeight.w400)))),
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, "/bookAppointemnt");
                    },
                    child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                            width: _deviceWidth * 0.7,
                            height: 40,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(-5, -5),
                                      blurRadius: 10,
                                      color: Colors.grey.shade200),
                                  BoxShadow(
                                      offset: Offset(5, 5),
                                      blurRadius: 10,
                                      color: Colors.grey.shade400),
                                ],
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "Book Your Appointment",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500)),
                            )))))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          pinkLine(_deviceWidth),
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.only(),
              child: Container(
                  width: _deviceWidth * 0.95,
                  height: _deviceHeihgt * 0.27,
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Container(
                          width: _deviceWidth * 0.95 * 0.4,
                          height: _deviceHeihgt * 0.27,
                          color: Colors.white,
                          child: Column(children: [
                            Padding(
                                padding: EdgeInsets.only(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Over",
                                            style: GoogleFonts.rubik(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400))),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text("5000 +",
                                              style: GoogleFonts.rubik(
                                                  textStyle: TextStyle(
                                                      color: Colors.pink,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400))),
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Women",
                                            style: GoogleFonts.rubik(
                                                textStyle: TextStyle(
                                                    color: Colors.pink,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400))),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text("love and",
                                              style: GoogleFonts.rubik(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400))),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Trust AMEERUNISA",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.robotoMono(
                                              textStyle: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontSize: 15,
                                                  wordSpacing: 1.7,
                                                  fontWeight:
                                                      FontWeight.w600))),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      width: _deviceWidth * 0.3,
                                      height: 1,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: _deviceWidth * 0.15,
                                            height: 1,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.center,
                                                    end: Alignment.centerLeft,
                                                    colors: [
                                                  Colors.pink,
                                                  Colors.white
                                                ])),
                                          ),
                                          Container(
                                            width: _deviceWidth * 0.15,
                                            height: 1,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.center,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                  Colors.pink,
                                                  Colors.white
                                                ])),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                          "Come, join the AMEERUNISA sisterhood",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.robotoMono(
                                              textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.w400))),
                                    ),
                                  ],
                                )),
                          ])),
                    ),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: imagesSlider(),
                    )
                  ]))),
          SizedBox(height: 5),
          pinkLine(_deviceWidth),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Text(
                            "75 Measurements. 2 Pictures.",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 22,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.w400)),
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Say hello to Smart Measurements.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoMono(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: _deviceWidth * 0.95,
                  height: _deviceHeihgt * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https:"
                                  "//i.ibb.co/ZG7k1X6/measurements.webp"))),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 15),
                    child: Text(
                      "Smart Measurements, our genius little feature, captures 100 measurements with just 2 photos! No more fumbling with a measuring tape. ",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                    )),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/measuerements");
                  },
                  child: Padding(
                      padding: EdgeInsets.only(),
                      child: Container(
                          width: _deviceWidth * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(-5, -5),
                                  blurRadius: 10,
                                  color: Colors.grey.shade200),
                              BoxShadow(
                                  offset: Offset(5, 5),
                                  blurRadius: 10,
                                  color: Colors.grey.shade400),
                            ],
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                              child: Text("Read More",
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500))))),
                )
              ],
            ),
          ),
          SizedBox(height: 25),
          pinkLine(_deviceWidth),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(),
            child: Container(
              width: _deviceWidth * 0.95,
              height: _deviceHeihgt * 0.2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-5, -5),
                        color: Colors.grey.shade200,
                        blurRadius: 10),
                    BoxShadow(
                        offset: Offset(5, 5),
                        color: Colors.grey.shade200,
                        blurRadius: 10),
                  ]),
              child: Row(
                children: [
                  Container(
                    width: _deviceWidth * 0.9 * 0.4,
                    height: _deviceHeihgt * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://i.ibb.co/vBTR0nY/machine.webp"))),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Container(
                        width: _deviceWidth * 0.9 * 0.6,
                        height: _deviceHeihgt * 0.2,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text("Get Something Stitched",
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Color(0xff051b2d),
                                            fontSize: 18,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.w400))),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                    "Tailor-make your dream outfits in size ‘U’",
                                    style: GoogleFonts.robotoMono(
                                        textStyle: TextStyle(
                                            color: Color(0xff051b2d),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400))),
                              ),
                              GestureDetector(
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
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(),
                                    child: Row(children: [
                                      Padding(
                                          padding: EdgeInsets.only(),
                                          child: Text("Explore",
                                              style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      color: Colors.pink,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)))),
                                      Icon(Icons.arrow_forward_ios,
                                          color: Colors.pink, size: 17)
                                    ]),
                                  ))
                            ]),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(),
            child: Padding(
                padding: EdgeInsets.only(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(),
                        child: Padding(
                          padding: EdgeInsets.only(),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(),
                                    child: Text("Size U",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500)))),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, left: 5, right: 5),
                                    child: Text(
                                        "Our fashion labels, made for your unique size. Customise details to your preferences.",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.robotoMono(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400)))),
                              ]),
                        )),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Container(
                        width: _deviceWidth * 0.95,
                        height: _deviceHeihgt * 0.4 * 0.45,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: _deviceWidth * 0.95 * 0.3,
                                height: _deviceHeihgt * 0.4 * 0.45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            "https://i.ibb.co/YZ8B0bn/sizeu1.jpg"))),
                              ),
                              Container(
                                width: _deviceWidth * 0.95 * 0.3,
                                height: _deviceHeihgt * 0.4 * 0.45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            "https://i.ibb.co/w0scCCM/sizeu2.jpg"))),
                              ),
                              Container(
                                width: _deviceWidth * 0.95 * 0.3,
                                height: _deviceHeihgt * 0.4 * 0.45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            "https://i.ibb.co/R6bMdDx/sizeu3.jpg"))),
                              ),
                            ]),
                      ),
                    ),
                    GestureDetector(
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
                              Provider.of<stateProvider>(context, listen: false)
                                  .buttonColor[i] = false;
                            }
                          }

                          Provider.of<stateProvider>(context, listen: false)
                              .buttonColor[0] = true;
                          Provider.of<stateProvider>(context, listen: false)
                              .setSelectedSubProduct(0);

                          Navigator.pushReplacementNamed(
                              context, "allProducts");
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            width: _deviceWidth * 0.5,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(-5, -5),
                                    blurRadius: 10,
                                    color: Colors.grey.shade200),
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                    color: Colors.grey.shade400),
                              ],
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text('Place order',
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500)))),
                          ),
                        ))
                  ],
                )),
          ),
          SizedBox(height: 20),
          pinkLine(_deviceWidth),
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.only(),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        "No standard sizes any more",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.pink,
                                fontSize: 22,
                                fontWeight: FontWeight.w400)),
                      )),
                  SizedBox(height: 12),
                  Container(
                      width: _deviceWidth * 0.95,
                      height: _deviceHeihgt * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://i.ibb.co/LhJ8Nvf/pose1.webp")))),
                  Padding(
                      padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: Text(
                        "Discover clothing that fits you perfectly every time. Our precise measurements ensure that every garment is tailored to your size, ensuring comfort and style in every stitch.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoMono(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ))
                ],
              )),
          SizedBox(
            height: 25,
          ),
          pinkLine(_deviceWidth),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    width: _deviceWidth,
                    height: _deviceHeihgt / 1.7 * 0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/subscribe.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Text(
                    "Get the list of your favorite designs every day",
                    style: GoogleFonts.robotoMono(
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: _deviceWidth * 0.8,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 30,
                              offset: Offset(5, 5)),
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 30,
                              offset: Offset(-5, -5)),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffffffff)),
                    height: 50,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: _deviceWidth * 0.60,
                            height: 50,
                            child: TextField(
                              controller:Provider.of<stateProvider>(context,listen:false).subscribeEmail,
                              style: GoogleFonts.jura(
                                  textStyle:
                                      TextStyle(color: Color(0xff1f1f1f))),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter your email",
                                hintStyle: GoogleFonts.jura(
                                    textStyle:
                                        TextStyle(color: Color(0xff2c2c2c))),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap:()async{
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

                    var send =
                    await sendMail
                      (body:Provider
                        .of<stateProvider>(context,listen:false).subscribeEmail.text,subject:"New Email",title:"subscribe",toEmail:"afridayan01@gmail.com").send();
                    if(Provider
                        .of<stateProvider>(context,listen:false).subscribeEmail.text == ""){
                      ScaffoldMessenger
                          .of(
                          context)
                          .showSnackBar(snakbarBuild(
                          "Please "
                              "Enter "
                              "Email ",
                          _deviceWidth,
                          context));

                    }
                    else{
                      if(send == "succe"
                          "ss"){
                        ScaffoldMessenger
                            .of(
                            context)
                            .showSnackBar(snakbarBuild(
                            "Subscrib"
                                "ed",
                            _deviceWidth,
                            context));

                      }
                      else{
                        ScaffoldMessenger
                            .of(
                            context)
                            .showSnackBar(snakbarBuild(
                            'Server '
                                'Error',
                            _deviceWidth,
                            context));

                      }
                    }
                    Navigator.of
                      (context).pop();

                  },
                  child:Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      width: _deviceWidth / 3,
                      height: 50,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(-5, -5),
                                blurRadius: 10,
                                color: Colors.grey.shade200),
                            BoxShadow(
                                offset: Offset(5, 5),
                                blurRadius: 10,
                                color: Colors.grey.shade400),
                          ],
                          color: Colors.yellow[700],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Subscribe",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: FaIcon(FontAwesomeIcons.bell,
                                      size: 15, color: Colors.white))
                            ]),
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }
}

Widget pinkLine(_deviceWidth) {
  return Container(
    width: _deviceWidth * 0.9,
    height: 1,
    child: Row(
      children: [
        Container(
          width: _deviceWidth * 0.45,
          height: 1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.centerLeft,
                  colors: [Colors.pink, Colors.white])),
        ),
        Container(
          width: _deviceWidth * 0.45,
          height: 1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.centerRight,
                  colors: [Colors.pink, Colors.white])),
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
