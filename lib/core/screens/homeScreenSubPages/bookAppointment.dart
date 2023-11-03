import '../'
    '../../core/utils/productsSlider'
    '.dart';
import '../../'
    '../helper/sendEmail/senMail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../state/stateProvider.dart';
class bookAppointment extends StatefulWidget {
  const bookAppointment({Key? key}) : super(key: key);
  @override
  State<bookAppointment> createState() => _bookAppointmentState();
}
class _bookAppointmentState extends State<bookAppointment> {
  @override
  Widget build(BuildContext context) {
    dynamic bookappointment()async{
      if(Provider
          .of<stateProvider>
        (context,listen:false)
          .appoPhNo.text == "" &&
          Provider.of<stateProvider>
            (context,listen: false)
              .appoMessage.text == ""
      && Provider.of<stateProvider>
            (context,listen:false)
              .appoName.text == ""){
        return "Fill All Fields";

      }



      var sendDetails = await
      sendMail(
          toEmail: "afridayan01"
              ".@gmail.com",
          subject:Provider
              .of<stateProvider>
            (context,listen:false)
              .appoPhNo.text,
          title: Provider
              .of<stateProvider>
            (context,listen:false)
              .appoName.text,
          body: Provider
              .of<stateProvider>
            (context,listen:false)
              .appoMessage.text);
      var send = await sendDetails
          .send();
      print(send);

      if(send == "success"){
        return "success";
      }
      else{
        return send;
      }

    }
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: SingleChildScrollView(
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
                          Navigator.pushReplacementNamed(context, "/homePage");
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
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.only(),
              child: Container(
                width: _deviceWidth,
                height: _deviceHeight * 0.78,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Book An Appointment",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 40,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w400)),
                        )),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "You Name",
                                  style: GoogleFonts.robotoMono(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: _deviceWidth * 0.025, top: 5),
                              child: textField(_deviceWidth, _deviceHeight,
                                  context, "Your Name", 50,Provider.of<stateProvider>(context,listen:false).appoName),
                            )
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Phone Number",
                                  style: GoogleFonts.robotoMono(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: _deviceWidth * 0.025, top: 5),
                              child: textField(_deviceWidth, _deviceHeight,
                                  context, "9372032629", 50,Provider.of<stateProvider>(context,listen:false).appoPhNo),
                            )
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Me"
                                      "ssage",
                                  style: GoogleFonts.robotoMono(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: _deviceWidth * 0.025, top: 5),
                              child: textField(_deviceWidth, _deviceHeight,
                                  context, "Need More blouse Designs ", 80,Provider.of<stateProvider>(context,listen:false).appoMessage),
                            )
                          ]),
                    ),
                    GestureDetector(
                      onTap:()
                      async{
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

                        dynamic
                        responseFromServer =
                        await
                        bookappointment();
                        if
                        (responseFromServer == "success"){
                          ScaffoldMessenger
                              .of(
                              context)
                              .showSnackBar(snakbarBuild(
                              "Appoin"
                                  "tm"
                                  "en"
                                  "t "
                                  "Bo"
                                  "ok"
                                  "ed",
                              _deviceWidth,
                              context));

                        }
                        else{
                          ScaffoldMessenger
                              .of(
                              context)
                              .showSnackBar(snakbarBuild(
                              responseFromServer.toString(),
                              _deviceWidth,
                              context));

                        }
                        Navigator.of(context).pop();

                      },
                      child:Padding(
                        padding: EdgeInsets.only(left: _deviceWidth * 0.25),
                        child: Container(
                          height: 50,
                          width: _deviceWidth * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.yellow[700],
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(-5, -5),
                                    blurRadius: 10,
                                    color: Colors.grey.shade200),
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                    color: Colors.grey.shade400),
                              ]),
                          child: Center(
                            child: Text(
                              "Book",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 2)),
                            ),
                          ),
                        ),
                      )
                    )
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}

Widget textField(double _deviceWidth,
    double _deviceHeight, context,
    hintText, double height,
    controller) {
  return Container(
      width: _deviceWidth * 0.95,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(-5, -5),
                blurRadius: 10,
                color: Colors.grey.shade200),
            BoxShadow(
                offset: Offset(5, 5),
                blurRadius: 10,
                color: Colors.grey.shade400),
          ]),
      child: Padding(
        padding: EdgeInsets.only
          (left: 20, top: 0),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          textInputAction: TextInputAction.next,
          style: GoogleFonts.rajdhani(
              textStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.rajdhani(
                  textStyle: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ));
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
