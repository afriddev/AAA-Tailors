import '../../utils/cachedImage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../state/stateProvider.dart';
import 'package:provider/provider.dart';

class orders extends StatefulWidget {
  orders({Key? key, required this.cont}) : super(key: key);
  dynamic cont;

  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
  dynamic oredrItems ;
  bool orders = true;
  @override
  void initState() {
    super.initState();
    var a = Provider.of<stateProvider>(widget.cont, listen: false).userData;
    oredrItems = a["orders"];
    if(a["orders"].length == 0){

    }
    else{
      orders = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _deviceHeight = MediaQuery.of(context).size.height;
    var controller = ScrollController();

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
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Your Recent Orders",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Colors.pink,
                          fontSize: 35,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2)),
                )),
            SizedBox(
              height: 10,
            ),
            orders
                ?
            Container(
                width:_deviceWidth,
                height: _deviceHeight*0.7,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Container(
                        width: _deviceWidth,
                        height: _deviceHeight / 2,
                        child:cachedImage(borderRadius:0,
                            imageUrl:"https://i.ibb.co/nkhnbWY/ab1.jpg" ),
                      ),
                    ),
                    GestureDetector(
                        onTap:(){
                          Provider.of<stateProvider>(context,listen:false).setNavIndex(0);
                        },
                        child:Padding(
                          padding: EdgeInsets.only(),
                          child: Container(
                            width: _deviceWidth * 0.8,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.black, borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text("Explore now",
                                    style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)))),
                          ),
                        )
                    )
                  ],
                )
            )


                :SizedBox(
              height: _deviceHeight * 0.7,
              width: _deviceWidth,
              child: ListView.builder(
                  itemCount: oredrItems.length,
                  controller: controller,
                  itemBuilder: (context, int index) => Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: orderProduct(_deviceWidth, _deviceHeight, context,
                          oredrItems[index]))),
            )
          ],
        ),
      ),
    );
  }
}

Widget orderProduct(_deviceWidth, _deviceHeight, context, orderItem) {
  return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
          width: _deviceWidth * 0.95,
          height: _deviceHeight / 7,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(-5, -5),
                    color: Colors.grey.shade200,
                    blurRadius: 10),
                BoxShadow(
                    offset: Offset(5, 5),
                    color: Colors.grey.shade400,
                    blurRadius: 10),
              ]),
          child: Padding(
              padding: EdgeInsets.only(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Container(
                        width: _deviceWidth * 0.95 * 0.25,
                        height: _deviceHeight / 7 * 0.9,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                orderItem['image'],
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      )),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Container(
                      width: _deviceWidth * 0.95 * 0.7,
                      child: Padding(
                          padding: EdgeInsets.only(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(orderItem['title'],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.w500))),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.yellow[900],
                                          size: 18,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 7),
                                          child: Text(
                                            orderItem['rating'].toString() +
                                                " Rating",
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                    color: Colors.grey.shade800,
                                                    fontSize: 13,
                                                    letterSpacing: 2,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ))
                                    ],
                                  )),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(),
                                        child: Text(
                                          "₹ " + orderItem['price'].toString(),
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(right: 15),
                                          child: Text(
                                            orderItem['status'],
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                    color:
                                                        orderItem['status'] ==
                                                                "completed"
                                                            ? Colors
                                                                .green.shade800
                                                            : Colors.red[800],
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 2)),
                                          ))
                                    ]),
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ))));
}
