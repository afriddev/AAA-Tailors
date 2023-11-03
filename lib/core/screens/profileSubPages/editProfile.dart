import 'package:flutter/material.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _deviceHright = MediaQuery.of(context).size.height;
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
      ],
    )));
  }
}
