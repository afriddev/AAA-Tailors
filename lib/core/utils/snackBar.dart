import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class snackBar extends StatefulWidget {
  snackBar({Key? key, required this.message}) : super(key: key);
  dynamic message;

  @override
  State<snackBar> createState() => _snackBarState();
}

class _snackBarState extends State<snackBar> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
      elevation: 0,
      backgroundColor: Colors.transparent.withOpacity(0),
      content: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xffa5ffa3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  (widget.message).toString(),
                  style: GoogleFonts.roboto(
                      color: Color(0xff15ff00),
                      letterSpacing: 1.5,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.yellow[700]),
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
}
