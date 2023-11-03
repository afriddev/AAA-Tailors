import '../'
    '../helper/server/deleteAtIndex'
    '.dart';
import '../../helper/server/getUser'
    '.dart';
import '../../helper/server/updateCount'
    '.dart';
import 'package:razorpay_web/razorpay_web.dart';

import '../utils/cachedImage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../state/stateProvider.dart';
import 'package:provider/provider.dart';
import '../screens/profileSubPages/loginPage.dart';

class addToBag extends StatefulWidget {
  addToBag({Key? key, this.cont})
      : super(key: key);

  dynamic cont;

  @override
  State<addToBag> createState() =>
      _addToBagState();
}

class _addToBagState
    extends State<addToBag> {


  Future<SharedPreferences> prefs =
      SharedPreferences.getInstance();
  late Razorpay _razorPay;
  void deleteItem()async{
    showDialog(context: context,
        useRootNavigator: false,
        builder:(context){
          return Center(child:CircularProgressIndicator());});
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    dynamic email = Provider.of<stateProvider>
      (context,listen:false).userData["email"];
    try {
      dynamic a = Provider.of<stateProvider>(
          widget.cont,
          listen: false)
          .userData;

      for(int index = 0;index >
          a['bagItems'].length;
      index++){
        dynamic response = await
        deleteAtIndex(email: email,
            position: index, key: "bagI"
                "tems").delete();
        dynamic userdata = await getUser(email: email).findUser();
        if(response == "deleteSuccess"){
          setState(() {
            Provider.of<stateProvider>(context, listen: false).userData = userdata;

            bagItems = a['bagItems'];
            if(bagItems.length == 0){
              bagItems = null;
            }
          });
        }
        else{

        }
        Navigator.of(context).pop();

      }

    } catch (e) {
      print(e);
    }
  }

  void paymentSuccess(PaymentSuccessResponse response) {
    deleteItem();

    Navigator.pushReplacementNamed(context, "/paymentSuccess");
  }
  void paymentError(PaymentFailureResponse response) {
    Navigator.pushReplacementNamed(context, "/paymentFailed");
  }

  var subTotal = 0;


  bool loggedIn = false;
  //as List<Map<dynamic, dynamic>>
  late dynamic bagItems;

  var count = 1;

  void delete(int index) {
    setState(() {
      var removePrice = bagItems[index]
              ['count'] *
          bagItems[index]['price'];
      subTotal =
          (subTotal - removePrice)
              .toInt();
      bagItems.removeAt(index);
    });
  }
  void setBagItems(){
    prefs.then((value) {
      setState(() {
        loggedIn =
            value.getBool("loggedIn") ??
                false;
      });
    });

    var a = Provider.of<stateProvider>(
        widget.cont,
        listen: true)
        .userData;

    if (a == null) {
      bagItems = null;
    } else {
      try {
        bagItems = a["bagItems"];
        if (bagItems.length == 0) {
          bagItems = null;
        } else {

          try {
            for (int i = 0;
            i < bagItems.length;
            i++) {
              setState(() {
                subTotal = (subTotal +
                    int.parse(
                        bagItems[i][
                        "price"]) *
                        bagItems[i]['count'])
                    .toInt();
              });
            }
          } catch (e) {
          }
        }
      } catch (e) {

        bagItems = null;
      }
    }

  }
  @override
  void initState() {
    super.initState();
    setBagItems();
    _razorPay = Razorpay();
    _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentSuccess);
    _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, paymentError);


  }

  @override
  Widget build(BuildContext context) {
    var razorpayOptions = {
      'key': 'rzp_test_LSjBqEzWv7Tn2q',
      "currency": "INR",
      'amount': (subTotal + 60) * 100,
      'name': "AAA TAILORS",
      'description': 'Online Tailoring',
      'send_sms_hash': true,
      "image": 'https://i.ibb.co/VHHJrQh/app-icon.jpg',
      'external': {
        'wallets': ['paytm', 'phonepay']
      },
      "theme": {"color": "#cff2c7"},
    };
    var _deviceWidth =
        MediaQuery.of(context)
            .size
            .width;
    var _deviceHeight =
        MediaQuery.of(context)
            .size
            .height;

    return SafeArea(
        child: Container(
            width: _deviceWidth,
            height: _deviceHeight,
            child: Provider
                .of<stateProvider>(context,listen:false).loggedIn
                ? bagItems == null
                    ? Container(
                        width:
                            _deviceWidth,
                        height:
                            _deviceHeight,
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets
                                      .only(),
                              child:
                                  Container(
                                width:
                                    _deviceWidth,
                                height:
                                    _deviceHeight /
                                        2,
                                child: cachedImage(
                                    borderRadius:
                                        0,
                                    imageUrl:
                                        "https://i.ibb.co/nkhnbWY/ab1.jpg"),
                              ),
                            ),
                            GestureDetector(
                                onTap:
                                    () {
                                  Provider.of<stateProvider>(context, listen: false)
                                      .setNavIndex(0);
                                },
                                child:
                                    Padding(
                                  padding:
                                      EdgeInsets.only(),
                                  child:
                                      Container(
                                    width:
                                        _deviceWidth * 0.8,
                                    height:
                                        50,
                                    decoration:
                                        BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15)),
                                    child:
                                        Center(child: Text("Explore now", style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500)))),
                                  ),
                                ))
                          ],
                        ))
                    : Column(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets
                                .only(
                                    left:
                                        10),
                            child:
                                Container(
                              width:
                                  _deviceWidth,
                              height:
                                  60,
                              child:
                                  Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Provider.of<stateProvider>(context, listen: false).setNavIndex(1);
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(color: Colors.grey.shade200, blurRadius: 10, offset: Offset(-5, -5)),
                                              BoxShadow(color: Colors.grey.shade400, blurRadius: 10, offset: Offset(5, 5)),
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
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 20),
                                    child:
                                        Container(
                                      width: _deviceWidth * 0.6,
                                      height: 50,
                                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage("images/logo.png"))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width:
                                _deviceWidth *
                                    0.9,
                            height:
                                _deviceHeight *
                                    0.785,
                            child:
                                Column(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                              children: [
                                SizedBox(
                                  height:
                                      _deviceHeight * 0.55,
                                  width:
                                      _deviceWidth,
                                  child:
                                      Padding(
                                    padding:
                                        EdgeInsets.only(),
                                    child: ListView.builder(
                                        itemCount: bagItems.length,
                                        itemBuilder: (context, int index) => Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Container(
                                                width: _deviceWidth * 0.9,
                                                height: _deviceHeight / 7,
                                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                                                  BoxShadow(offset: Offset(-5, -5), color: Colors.grey.shade200, blurRadius: 10),
                                                  BoxShadow(offset: Offset(5, 5), color: Colors.grey.shade400, blurRadius: 10),
                                                ]),
                                                child: Padding(
                                                    padding: EdgeInsets.only(),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Padding(
                                                            padding: EdgeInsets.only(left: 5),
                                                            child: Container(
                                                              width: _deviceWidth * 0.9 * 0.25,
                                                              height: _deviceHeight / 7 * 0.9,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                    fit: BoxFit.cover,
                                                                    image: NetworkImage(
                                                                      bagItems[index]["image"],
                                                                    ),
                                                                  ),
                                                                  borderRadius: BorderRadius.circular(10)),
                                                            )),
                                                        Padding(
                                                          padding: EdgeInsets.only(),
                                                          child: Container(
                                                            width: _deviceWidth * 0.9 * 0.7,
                                                            child: Padding(
                                                                padding: EdgeInsets.only(),
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.only(top: 5),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(bagItems[index]["title"], textAlign: TextAlign.center,
                                                                              style: GoogleFonts.roboto(
                                                                                  textStyle: TextStyle(
                                                                                      fontSize: 15, color: Colors.black,
                                                                                      letterSpacing: 2, fontWeight: FontWeight.w500))),
                                                                          GestureDetector(
                                                                              onTap: () async {
                                                                                showDialog(context: context,
                                                                                    useRootNavigator: false,
                                                                                    builder:(context){
                                                                                  return Center(child:CircularProgressIndicator());});
                                                                                SharedPreferences prefrences = await SharedPreferences.getInstance();
                                                                                dynamic email = Provider.of<stateProvider>
                                                                                  (context,listen:false).userData["email"];
                                                                                try {
                                                                                  dynamic response = await deleteAtIndex(email: email, position: index, key: "bagItems").delete();
                                                                                  dynamic userdata = await getUser(email: email).findUser();
                                                                                  if(response == "deleteSuccess"){
                                                                                    setState(() {
                                                                                      print(bagItems[index]['count']);
                                                                                      subTotal = (subTotal -
                                                                                          int.parse(
                                                                                              bagItems[index][
                                                                                              "price"]) *
                                                                                              bagItems[index]['count'])
                                                                                          .toInt();


                                                                                      Provider.of<stateProvider>(context, listen: false).userData = userdata;
                                                                                      dynamic a = Provider.of<stateProvider>(
                                                                                          widget.cont,
                                                                                          listen: false)
                                                                                          .userData;
                                                                                      bagItems = a['bagItems'];


                                                                                      if(bagItems.length == 0){
                                                                                        bagItems = null;
                                                                                      }
                                                                                    });
                                                                                  }
                                                                                  else{
                                                                                    ScaffoldMessenger.of(context)
                                                                                        .showSnackBar(snakbarBuild(
                                                                                        response,
                                                                                        _deviceWidth,
                                                                                        context));
                                                                                  }
                                                                                  Navigator.of(context).pop();

                                                                                } catch (e) {
                                                                                  print(e);
                                                                                }
                                                                              },
                                                                              child: Padding(
                                                                                  padding: EdgeInsets.only(right: 10),
                                                                                  child: Container(
                                                                                      width: 25,
                                                                                      height: 25,
                                                                                      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(2)),
                                                                                      child: Center(
                                                                                        child: Icon(
                                                                                          Icons.delete,
                                                                                          size: 20,
                                                                                          color: Color(0xfffa4b01),
                                                                                        ),
                                                                                      ))))
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
                                                                                  bagItems[index]['rating'].toString() + " Rating",
                                                                                  style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 13, letterSpacing: 2, fontWeight: FontWeight.w400)),
                                                                                ))
                                                                          ],
                                                                        )),
                                                                    Padding(
                                                                      padding: EdgeInsets.only(bottom: 5),
                                                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                        Padding(
                                                                          padding: EdgeInsets.only(),
                                                                          child: Text(
                                                                            "₹ " + bagItems[index]['price'].toString(),
                                                                            style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500)),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.only(right: 20),
                                                                          child: Row(children: [
                                                                            GestureDetector(
                                                                              onTap: () async{
                                                                                showDialog(context: context,
                                                                                    useRootNavigator: false,
                                                                                    builder:(context){
                                                                                      return Center(child:CircularProgressIndicator());});
                                                                                SharedPreferences prefrences = await SharedPreferences.getInstance();
                                                                                dynamic email = Provider.of<stateProvider>
                                                                                  (context,listen:false).userData["email"];
                                                                                int value = bagItems[index]['count'];
                                                                                try {
                                                                                  if(value >1){
                                                                                    dynamic response = await updateCount(
                                                                                        position: index,
                                                                                        email: email,
                                                                                        value: value-1
                                                                                    )
                                                                                        .update();
                                                                                    dynamic userdata = await getUser(
                                                                                        email: email)
                                                                                        .findUser();
                                                                                    if (response ==
                                                                                        "updateCompleted") {
                                                                                      setState(() {
                                                                                        subTotal = (subTotal -
                                                                                            int.parse(
                                                                                                bagItems[index][
                                                                                                "price"]))
                                                                                            .toInt();
                                                                                        Provider
                                                                                            .of<
                                                                                            stateProvider>(
                                                                                            context,
                                                                                            listen: false)
                                                                                            .userData =
                                                                                            userdata;
                                                                                        dynamic a = Provider
                                                                                            .of<
                                                                                            stateProvider>(
                                                                                            widget
                                                                                                .cont,
                                                                                            listen: false)
                                                                                            .userData;
                                                                                        bagItems =
                                                                                        a['bagItems'];
                                                                                        if (bagItems
                                                                                            .length ==
                                                                                            0) {
                                                                                          bagItems =
                                                                                          null;
                                                                                        }
                                                                                      });
                                                                                    }
                                                                                    else {
                                                                                      ScaffoldMessenger
                                                                                          .of(
                                                                                          context)
                                                                                          .showSnackBar(
                                                                                          snakbarBuild(
                                                                                              response,
                                                                                              _deviceWidth,
                                                                                              context));
                                                                                    }

                                                                                  }
                                                                                  else{
                                                                                    print("-------------else--------------");

                                                                                  }

                                                                                }
                                                                                catch (e){
                                                                                  print("--------------error--------------");
                                                                                  print(e);

                                                                                }
                                                                                Navigator.of(context).pop();

                                                                              },
                                                                              child: Padding(
                                                                                padding: EdgeInsets.only(),
                                                                                child: Container(
                                                                                  width: 30,
                                                                                  height: 30,
                                                                                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.yellow[700], boxShadow: [
                                                                                    BoxShadow(offset: Offset(-5, -5), blurRadius: 10, color: Colors.grey.shade200),
                                                                                    BoxShadow(offset: Offset(5, 5), blurRadius: 10, color: Colors.grey.shade400),
                                                                                  ]),
                                                                                  child: Center(
                                                                                    child: Icon(Icons.remove),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsets.only(left: 3),
                                                                              child: Container(width: 30, height: 30, child: Center(child: Text(bagItems[index]['count'].toString(), style: TextStyle(fontSize: 20)))),
                                                                            ),
                                                                            GestureDetector(
                                                                                onTap: () async{
                                                                                  showDialog(context: context,
                                                                                      useRootNavigator: false,
                                                                                      builder:(context){
                                                                                        return Center(child:CircularProgressIndicator());});
                                                                                  SharedPreferences prefrences = await SharedPreferences.getInstance();
                                                                                  dynamic email = Provider.of<stateProvider>
                                                                                    (context,listen:false).userData["email"];
                                                                                  int value = bagItems[index]['count'];
                                                                                  try {
                                                                                    dynamic response = await updateCount(
                                                                                        position: index,
                                                                                        email: email,
                                                                                        value: value+1
                                                                                    )
                                                                                        .update();
                                                                                    dynamic userdata = await getUser(
                                                                                        email: email)
                                                                                        .findUser();
                                                                                    if (response ==
                                                                                        "updateCompleted") {
                                                                                      setState(() {
                                                                                        subTotal = (subTotal +
                                                                                            int.parse(
                                                                                                bagItems[index][
                                                                                                "price"]))
                                                                                            .toInt();
                                                                                        Provider
                                                                                            .of<
                                                                                            stateProvider>(
                                                                                            context,
                                                                                            listen: false)
                                                                                            .userData =
                                                                                            userdata;
                                                                                        dynamic a = Provider
                                                                                            .of<
                                                                                            stateProvider>(
                                                                                            widget
                                                                                                .cont,
                                                                                            listen: false)
                                                                                            .userData;
                                                                                        bagItems =
                                                                                        a['bagItems'];
                                                                                        if (bagItems
                                                                                            .length ==
                                                                                            0) {
                                                                                          bagItems =
                                                                                          null;
                                                                                        }
                                                                                      });
                                                                                    }
                                                                                    else {
                                                                                      ScaffoldMessenger
                                                                                          .of(
                                                                                          context)
                                                                                          .showSnackBar(
                                                                                          snakbarBuild(
                                                                                              response,
                                                                                              _deviceWidth,
                                                                                              context));
                                                                                    }
                                                                                  }
                                                                                  catch (e){

                                                                                  }
                                                                                    Navigator.of(context).pop();


                                                                                },
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.only(left: 3),
                                                                                  child: Container(
                                                                                    width: 30,
                                                                                    height: 30,
                                                                                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.yellow[700], boxShadow: [
                                                                                      BoxShadow(offset: Offset(-5, -5), blurRadius: 10, color: Colors.grey.shade200),
                                                                                      BoxShadow(offset: Offset(5, 5), blurRadius: 10, color: Colors.grey.shade400),
                                                                                    ]),
                                                                                    child: Center(
                                                                                      child: Icon(Icons.add),
                                                                                    ),
                                                                                  ),
                                                                                )),
                                                                          ]),
                                                                        )
                                                                      ]),
                                                                    )
                                                                  ],
                                                                )),
                                                          ),
                                                        )
                                                      ],
                                                    ))))),
                                  ),
                                ),
                                /**
                 *
                 *
                 *
                 */

                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(),
                                            child: Container(
                                              width: _deviceWidth * 0.95,
                                              height: 0.5,
                                              decoration: BoxDecoration(color: Colors.grey.shade300),
                                            )),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10, right: 10, top: 2),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(),
                                                  child: Text(
                                                    "Subtotal",
                                                    style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 17, letterSpacing: 2, fontWeight: FontWeight.w500)),
                                                  )),
                                              Padding(
                                                  padding: EdgeInsets.only(),
                                                  child: Text(
                                                    "₹ " + subTotal.toString(),
                                                    style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 17, letterSpacing: 2, fontWeight: FontWeight.w500)),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10, right: 10, top: 2),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(),
                                                  child: Text(
                                                    "Delivery",
                                                    style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 17, letterSpacing: 2, fontWeight: FontWeight.w500)),
                                                  )),
                                              Padding(
                                                  padding: EdgeInsets.only(),
                                                  child: Text(
                                                    "₹ " + "60",
                                                    style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 17, letterSpacing: 2, fontWeight: FontWeight.w500)),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 2),
                                            child: Container(
                                              width: _deviceWidth * 0.95,
                                              height: 0.5,
                                              decoration: BoxDecoration(color: Colors.grey.shade500),
                                            )),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10, right: 10, top: 2),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(),
                                                  child: Text(
                                                    "Total",
                                                    style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black, fontSize: 17, letterSpacing: 2, fontWeight: FontWeight.w500)),
                                                  )),
                                              Padding(
                                                  padding: EdgeInsets.only(),
                                                  child: Text(
                                                    "₹ " + (subTotal + 60).toString(),
                                                    style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black, fontSize: 17, letterSpacing: 2, fontWeight: FontWeight.w500)),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 2),
                                            child: Container(
                                              width: _deviceWidth * 0.95,
                                              height: 0.5,
                                              decoration: BoxDecoration(color: Colors.grey.shade500),
                                            )),
                                       GestureDetector(
                                         onTap:(){
                                           try {
                                             _razorPay.open(razorpayOptions);
                                           } catch (e) {
                                             print("afrid");
                                             print(e);
                                             print("afrid");

                                           }

                                         },
                                         child: Padding(
                                           padding: EdgeInsets.only(top: 5),
                                           child: Container(
                                               width: _deviceWidth * 0.8,
                                               height: 50,
                                               decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(7)),
                                               child: Center(
                                                   child: Text(
                                                     "Place Order",
                                                     style: GoogleFonts.robotoMono(textStyle: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500)),
                                                   ))),
                                         )
                                       )
                                      ],
                                    ))
                              ],
                            ),
                          )
                        ],
                      )
                : Container(
                    width: _deviceWidth,
                    height:
                        _deviceHeight *
                            0.78,
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets
                                  .only(),
                          child:
                              Container(
                            width:
                                _deviceWidth,
                            height:
                                _deviceHeight /
                                    2,
                            child:
                                cachedImage(
                              borderRadius:
                                  0,
                              imageUrl:
                                  "https://i.ibb.co/nkhnbWY/ab1.jpg",
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets
                              .only(
                                  left:
                                      20,
                                  right:
                                      30,
                                  bottom:
                                      0),
                          child: Center(
                              child:
                                  Text(
                            "Please Login To Continue",
                            style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize:
                                        35,
                                    color:
                                        Colors.black,
                                    fontWeight: FontWeight.bold)),
                          )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<stateProvider>(
                                    context,
                                    listen:
                                        false)
                                .setNavIndex(
                                    3);
                          },
                          child:
                              Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    40),
                            child: Container(
                                width: _deviceWidth * 0.8,
                                height: 50,
                                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                      " Go to login",
                                      style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white))),
                                )),
                          ),
                        )
                      ],
                    ))));
  }
}
