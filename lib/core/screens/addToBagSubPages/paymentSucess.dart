import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class paymentSuccess extends StatefulWidget {
  paymentSuccess({
    Key? key,
  }) : super(key: key);

  @override
  State<paymentSuccess> createState() => _paymentSuccessState();
}

class _paymentSuccessState extends State<paymentSuccess> {
  @override
  Widget build(BuildContext context) {
    dynamic _deviceWidth = MediaQuery.of(context).size.width;
    dynamic _deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(),
                child: Container(
                  width: _deviceWidth,
                  height: _deviceHeight / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i.ibb.co/jWrKKps/payment-Success.png"))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Container(
                  child: Text(
                    "Payment Successful",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 32,
                            letterSpacing: 2,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Text(
                  "Your transaction has been completed successfully. Thank you for your purchase.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.robotoMono(
                      textStyle: TextStyle(
                          fontSize: 20, color: Colors.black, letterSpacing: 1)),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, "/addToCartPage");
          },
          child: Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: Container(
                  height: 50,
                  width: _deviceWidth * 0.8,
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
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text("Go back",
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w500))),
                  ))),
        )
      ],
    ));
  }
}
