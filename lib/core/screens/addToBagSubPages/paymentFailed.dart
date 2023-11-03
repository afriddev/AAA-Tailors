import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class paymentFailed extends StatefulWidget {
  const paymentFailed({Key? key}) : super(key: key);

  @override
  State<paymentFailed> createState() => _paymentFailedState();
}

class _paymentFailedState extends State<paymentFailed> {
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
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(),
                child: Container(
                  width: _deviceWidth,
                  height: _deviceHeight / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i.ibb.co/DLyCgWf/payment-Failed.png"))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Container(
                  child: Text(
                    "Payment Failed",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 32,
                            letterSpacing: 2,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Text(
                  "Oops! Your payment didn't go through. Please try again later.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.robotoMono(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
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
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text("Retry",
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
