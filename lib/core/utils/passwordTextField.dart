import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../state/stateProvider.dart';
import 'package:provider/provider.dart';

class passwordTextField extends StatefulWidget {
  const passwordTextField({Key? key}) : super(key: key);

  @override
  State<passwordTextField> createState() => _passwordTextFieldState();
}

class _passwordTextFieldState extends State<passwordTextField> {
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
                    Icons.lock,
                    color: Colors.black,
                    size: 26,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(),
                child: Container(
                  width: _deviceWidth * 0.6,
                  height: 50,
                  child: TextField(
                    controller:Provider.of<stateProvider>(context,listen:false).loginPassword,
                    textInputAction: TextInputAction.next,
                    obscureText: obsec,
                    style: GoogleFonts.rajdhani(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                    decoration: InputDecoration(
                        hintText: "password",
                        hintStyle: GoogleFonts.rajdhani(
                            textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 17,
                                fontWeight: FontWeight.w600)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                )),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (visibleicon == Icons.visibility_off) {
                    visibleicon = Icons.visibility;
                    obsec = false;
                  } else {
                    visibleicon = Icons.visibility_off;
                    obsec = true;
                  }
                });
              },
              child: Padding(
                padding: EdgeInsets.only(),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Icon(
                    visibleicon,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

bool obsec = true;
IconData visibleicon = Icons.visibility_off;
