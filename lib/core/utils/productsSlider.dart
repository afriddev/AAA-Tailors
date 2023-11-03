import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cachedImage.dart';
import '../../state/stateProvider.dart';
import 'package:provider/provider.dart';

import '../screens/homeScreenData.dart';

class productsSlider extends StatefulWidget {
  const productsSlider({Key? key}) : super(key: key);

  @override
  State<productsSlider> createState() => _productsSliderState();
}

ScrollController controller = ScrollController();

class _productsSliderState extends State<productsSlider> {
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _deviceHeight = MediaQuery.of(context).size.height;
    return SizedBox(
        height: _deviceHeight / 3 * 0.8,
        child: ListView.builder(
            controller: controller,
            itemCount: mainProductList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: _deviceWidth * 0.3,
                      height: _deviceHeight / 3.2 * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: cachedImage(
                        imageUrl: mainProductList[index][1],
                        borderRadius: 10,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          for (int i = 0;
                              i <
                                  Provider.of<stateProvider>(context,
                                          listen: false)
                                      .buttonColor
                                      .length;
                              i++) {
                            if (Provider.of<stateProvider>(context,
                                        listen: false)
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

                          Navigator.pushReplacementNamed(
                              context, "allProducts");
                        },
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Container(
                              height: 40,
                              width: _deviceWidth * 0.33 * 0.7,
                              decoration: BoxDecoration(
                                  color: Colors.purple[700],
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
                              child: Center(
                                  child: Text(
                                mainProductList[index][0],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        wordSpacing: 2.2,
                                        fontWeight: FontWeight.w500)),
                              )),
                            )))
                  ],
                ))));
  }
}
