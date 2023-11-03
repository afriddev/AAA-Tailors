import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/homeScreenData.dart';
import 'cachedImage.dart';
import '../../state/stateProvider.dart';
import 'package:provider/provider.dart';

class productItem extends StatefulWidget {
  const productItem({Key? key}) : super(key: key);

  @override
  State<productItem> createState() => _productItemState();
}

ScrollController controller = ScrollController();

class _productItemState extends State<productItem> {
  @override
  Widget build(BuildContext context) {
    dynamic _deviceWidth = MediaQuery.of(context).size.width;
    dynamic _deviceHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: _deviceHeight * 0.82,
      child: ListView.builder(
          controller: controller,
          itemCount: mainProductList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                for (int i = 0;
                    i <
                        Provider.of<stateProvider>(context, listen: false)
                            .buttonColor
                            .length;
                    i++) {
                  if (Provider.of<stateProvider>(context, listen: false)
                          .buttonColor[i] ==
                      true) {
                    Provider.of<stateProvider>(context, listen: false)
                        .buttonColor[i] = false;
                  }
                }

                Provider.of<stateProvider>(context, listen: false)
                    .buttonColor[index] = true;
                Provider.of<stateProvider>(context, listen: false)
                    .setSelectedSubProduct(index);

                Navigator.pushReplacementNamed(context, "allProducts");
              },
              child: Padding(
                padding: EdgeInsets.only(top: 25),
                child: Container(
                  width: _deviceWidth,
                  height: _deviceHeight / 7,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                            child: Container(
                          width: _deviceWidth * 0.7,
                          height: _deviceHeight / 7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(-5, -5),
                                    blurRadius: 0,
                                    color: Colors.transparent),
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 15,
                                    color: Colors.grey.shade700)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  mainProductList[index][0],
                                  style: GoogleFonts.robotoMono(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5, left: 20),
                                child: Text(
                                  mainProductList[index][2],
                                  style: GoogleFonts.robotoMono(
                                      fontSize: 14,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                        )),

                      Positioned(
                        left: _deviceWidth * 0.08,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(-5, -5),
                                    blurRadius: 0,
                                    color: Colors.transparent),
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 15,
                                    color: Colors.grey.shade700)
                              ]),
                          width: _deviceWidth * 0.22,
                          height: _deviceHeight / 10,
                          child: cachedImage(
                              imageUrl: mainProductList[index][1],
                              borderRadius: 20),
                        ),
                      ),
                      Positioned(
                          right:
                          _deviceWidth * 0.1,
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(-5, -5),
                                        blurRadius: 0,
                                        color: Colors.transparent),
                                    BoxShadow(
                                        offset: Offset(5, 5),
                                        blurRadius: 15,
                                        color: Colors.grey.shade700)
                                  ]),
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xfffa0341),
                                  // color: Colors.yellow[900],
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ))),
    );
  }
}
