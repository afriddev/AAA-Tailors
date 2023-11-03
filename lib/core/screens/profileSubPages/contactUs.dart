import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class contactUs extends StatefulWidget {
  const contactUs({Key? key}) : super(key: key);

  @override
  State<contactUs> createState() => _contactUsState();
}

class _contactUsState extends State<contactUs> {
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
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
                        Navigator.pushReplacementNamed(context, "/profile");
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
                  onTap: () {},
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
          height: 15,
        ),
        Container(
          width: _deviceWidth,
          height: _deviceHeight * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              columnContainer(
                  _deviceWidth, _deviceHeight, "Name :", "Shaik Ameerunisa"),
              columnContainer(_deviceWidth, _deviceHeight, "Email :",
                  "ameerunisatailors@gmail.com"),
              columnContainer(_deviceWidth, _deviceHeight, "Whatsapp No :",
                  "+91 9391463341"),
              columnContainer(_deviceWidth, _deviceHeight, "Address :",
                  "1-18 muslim bazar,"
                      "karalapadu,"
                      "piduguralla(m)"
                      ",guntur(dist),"
                      "Andra pradesh,"
                      "india - 522437"),
            ],
          ),
        )
      ],
    ));
  }
}

Widget columnContainer(_deviceWidth, _deviceHeight, title, subTitile) {
  return Padding(
    padding: EdgeInsets.only(top: 15, left: 15, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(),
          child: Text(
            title,
            style: GoogleFonts.roboto(
                color: Colors.yellow[800],
                fontSize: 25,
                fontWeight: FontWeight.w500,
                letterSpacing: 2),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            subTitile,
            style: GoogleFonts.robotoMono(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                letterSpacing: 2),
          ),
        ),
      ],
    ),
  );
}
