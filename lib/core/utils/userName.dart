import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../state/stateProvider.dart';

class userName extends StatefulWidget {
  const userName({Key? key}) : super(key: key);

  @override
  State<userName> createState() => _userNameState();
}

class _userNameState extends State<userName> {
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(),
      child: Container(
        width: _deviceWidth * 0.9,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 30, offset: Offset(-5, -5), color: Colors.white),
              BoxShadow(
                  blurRadius: 30,
                  offset: Offset(5, 5),
                  color: Colors.grey.shade300),
            ]),
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.verified_user_outlined,
                    color: Colors.black,
                    size: 26,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(),
                child: Container(
                  width: _deviceWidth * 0.65,
                  height: 50,
                  child: TextField(
                    controller:Provider.of<stateProvider>(context,listen:false).userName,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    style: GoogleFonts.rajdhani(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                    decoration: InputDecoration(
                        hintText: "User Name",
                        hintStyle: GoogleFonts.rajdhani(
                            textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 17,
                                fontWeight: FontWeight.w600)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
