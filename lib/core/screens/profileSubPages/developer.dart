import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/cachedImage.dart';
import 'package:provider/provider.dart';

import '../../../state/stateProvider.dart';

class developer extends StatefulWidget {
  const developer({Key? key}) : super(key: key);

  @override
  State<developer> createState() => _developerState();
}

class _developerState extends State<developer> {
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
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
          Padding(
            padding: EdgeInsets.only(),
            child: Container(
                width: _deviceWidth,
                height: _deviceHeight * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: _deviceWidth * 0.025),
                      child: Container(
                        width: _deviceWidth * 0.95,
                        height: _deviceHeight * 0.4,
                        child: cachedImage(
                            imageUrl:
                                "https://avatars.githubusercontent.com/u/88675474?v=4",
                            borderRadius: 10),
                      ),
                    ),
                    columnContainer(
                        _deviceWidth, _deviceHeight, "Name :", "Shaik Afrid"),
                    columnContainer(_deviceWidth, _deviceHeight, "Email :",
                        "afridayan01@gmail.com"),
                    columnContainer(
                        _deviceWidth, _deviceHeight, "Github : ", "@afriddev"),
                  ],
                )),
          )
        ],
      ),
    );
  }
}

Widget columnContainer(_deviceWidth, _deviceHeight, title, subTitile) {
  return Padding(
    padding: EdgeInsets.only(top: 10, left: 15),
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
