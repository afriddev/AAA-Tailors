import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../state/stateProvider.dart';
import 'package:provider/provider.dart';

class otpField extends StatefulWidget {
  const otpField({Key? key}) : super(key: key);

  @override
  State<otpField> createState() => _otpFieldState();
}

class _otpFieldState extends State<otpField> {
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
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
                    Icons.vpn_key_outlined,
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
                    controller:Provider.of<stateProvider>(context,listen:false).otp,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    style: GoogleFonts.rajdhani(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                    decoration: InputDecoration(
                        hintText: "Enter Otp",
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
    ;
  }
}
