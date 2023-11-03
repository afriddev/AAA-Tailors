import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cachedImage.dart';
import '../../state/stateProvider.dart';
import 'package:provider/provider.dart';

class bottomAllProducts extends StatefulWidget {
  bottomAllProducts({Key? key, required this.Products}) : super(key: key);
  List Products;

  @override
  State<bottomAllProducts> createState() => _bottomAllProductsState();
}

class _bottomAllProductsState extends State<bottomAllProducts> {
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _deviceHeight = MediaQuery.of(context).size.height;

    return Padding(
        padding: EdgeInsets.only(),
        child: Provider.of<stateProvider>(context, listen: true).selectedSubProduct ==
                0
            ? SizedBox(
                child: GridView.count(
                childAspectRatio: ((_deviceWidth * 0.45) / (_deviceHeight / 3)),
                shrinkWrap: true,
                physics: ScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(
                    widget.Products[0].length,
                    (index) => productContainer(
                        _deviceWidth,
                        _deviceHeight,
                        widget.Products[0][index][1],
                        widget.Products[0][index][0],
                        widget.Products[0][index][3],
                        context,
                        widget.Products[0][index][2],
                        widget.Products[0][index][4],
                        widget.Products[0][index][5],
                        widget.Products[0][index][6])),
              ))
            : Provider.of<stateProvider>(context, listen: true).selectedSubProduct ==
                    1
                ? SizedBox(
                    child: GridView.count(
                    physics: ScrollPhysics(),
                    childAspectRatio:
                        ((_deviceWidth * 0.45) / (_deviceHeight / 3)),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(
                        widget.Products[1].length,
                        (index) => productContainer(
                            _deviceWidth,
                            _deviceHeight,
                            widget.Products[1][index][1],
                            widget.Products[1][index][0],
                            widget.Products[1][index][3],
                            context,
                            widget.Products[1][index][2],
                            widget.Products[1][index][4],
                            widget.Products[1][index][5],
                            widget.Products[1][index][6])),
                  ))
                : Provider.of<stateProvider>(context, listen: true).selectedSubProduct ==
                        2
                    ? SizedBox(
                        child: GridView.count(
                        physics: ScrollPhysics(),
                        childAspectRatio:
                            ((_deviceWidth * 0.45) / (_deviceHeight / 3)),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: List.generate(
                            widget.Products[2].length,
                            (index) => productContainer(
                                _deviceWidth,
                                _deviceHeight,
                                widget.Products[2][index][1],
                                widget.Products[2][index][0],
                                widget.Products[2][index][3],
                                context,
                                widget.Products[2][index][2],
                                widget.Products[2][index][4],
                                widget.Products[2][index][5],
                                widget.Products[2][index][6])),
                      ))
                    : Provider.of<stateProvider>(context, listen: true).selectedSubProduct ==
                            3
                        ? SizedBox(
                            child: GridView.count(
                            physics: ScrollPhysics(),
                            childAspectRatio:
                                ((_deviceWidth * 0.45) / (_deviceHeight / 3)),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            children: List.generate(
                                widget.Products[3].length,
                                (index) => productContainer(
                                    _deviceWidth,
                                    _deviceHeight,
                                    widget.Products[3][index][1],
                                    widget.Products[3][index][0],
                                    widget.Products[3][index][3],
                                    context,
                                    widget.Products[3][index][2],
                                    widget.Products[3][index][4],
                                    widget.Products[3][index][5],
                                    widget.Products[3][index][6])),
                          ))
                        : Provider.of<stateProvider>(context, listen: true)
                                    .selectedSubProduct ==
                                4
                            ? SizedBox(
                                child: GridView.count(
                                physics: ScrollPhysics(),
                                childAspectRatio: ((_deviceWidth * 0.45) /
                                    (_deviceHeight / 3)),
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                children: List.generate(
                                    widget.Products[4].length,
                                    (index) => productContainer(
                                        _deviceWidth,
                                        _deviceHeight,
                                        widget.Products[4][index][1],
                                        widget.Products[4][index][0],
                                        widget.Products[4][index][3],
                                        context,
                                        widget.Products[4][index][2],
                                        widget.Products[4][index][4],
                                        widget.Products[4][index][5],
                                        widget.Products[4][index][6])),
                              ))
                            : Provider.of<stateProvider>(context, listen: true)
                                        .selectedSubProduct ==
                                    5
                                ? SizedBox(
                                    child: GridView.count(
                                    physics: ScrollPhysics(),
                                    childAspectRatio: ((_deviceWidth * 0.45) /
                                        (_deviceHeight / 3)),
                                    shrinkWrap: true,
                                    crossAxisCount: 2,
                                    children: List.generate(
                                        widget.Products[5].length,
                                        (index) => productContainer(
                                            _deviceWidth,
                                            _deviceHeight,
                                            widget.Products[5][index][1],
                                            widget.Products[5][index][0],
                                            widget.Products[5][index][3],
                                            context,
                                            widget.Products[5][index][2],
                                            widget.Products[5][index][4],
                                            widget.Products[5][index][5],
                                            widget.Products[5][index][6])),
                                  ))
                                : Provider.of<stateProvider>(context, listen: true)
                                            .selectedSubProduct ==
                                        6
                                    ? SizedBox(
                                        child: GridView.count(
                                        physics: ScrollPhysics(),
                                        childAspectRatio:
                                            ((_deviceWidth * 0.45) /
                                                (_deviceHeight / 3)),
                                        shrinkWrap: true,
                                        crossAxisCount: 2,
                                        children: List.generate(
                                            widget.Products[6].length,
                                            (index) => productContainer(
                                                _deviceWidth,
                                                _deviceHeight,
                                                widget.Products[6][index][1],
                                                widget.Products[6][index][0],
                                                widget.Products[6][index][3],
                                                context,
                                                widget.Products[6][index][2],
                                                widget.Products[6][index][4],
                                                widget.Products[6][index][5],
                                                widget.Products[6][index][6])),
                                      ))
                                    : Provider.of<stateProvider>(context, listen: true)
                                                .selectedSubProduct ==
                                            7
                                        ? SizedBox(
                                            child: GridView.count(
                                            physics: ScrollPhysics(),
                                            childAspectRatio:
                                                ((_deviceWidth * 0.45) /
                                                    (_deviceHeight / 3)),
                                            shrinkWrap: true,
                                            crossAxisCount: 2,
                                            children: List.generate(
                                                widget.Products[7].length,
                                                (index) => productContainer(
                                                    _deviceWidth,
                                                    _deviceHeight,
                                                    widget.Products[7][index]
                                                        [1],
                                                    widget.Products[7][index]
                                                        [0],
                                                    widget.Products[7][index]
                                                        [3],
                                                    context,
                                                    widget.Products[7][index]
                                                        [2],
                                                    widget.Products[7][index]
                                                        [4],
                                                    widget.Products[7][index]
                                                        [5],
                                                    widget.Products[7][index]
                                                        [6])),
                                          ))
                                        : Provider.of<stateProvider>(context, listen: true)
                                                    .selectedSubProduct ==
                                                8
                                            ? SizedBox(
                                                child: GridView.count(
                                                physics: ScrollPhysics(),
                                                childAspectRatio:
                                                    ((_deviceWidth * 0.45) /
                                                        (_deviceHeight / 3)),
                                                shrinkWrap: true,
                                                crossAxisCount: 2,
                                                children: List.generate(
                                                    widget.Products[8].length,
                                                    (index) => productContainer(
                                                        _deviceWidth,
                                                        _deviceHeight,
                                                        widget.Products[8]
                                                            [index][1],
                                                        widget.Products[8]
                                                            [index][0],
                                                        widget.Products[8]
                                                            [index][3],
                                                        context,
                                                        widget.Products[8]
                                                            [index][2],
                                                        widget.Products[8]
                                                            [index][4],
                                                        widget.Products[8]
                                                            [index][5],
                                                        widget.Products[8]
                                                            [index][6])),
                                              ))
                                            : Text("Hello"));
  }
}

Widget productContainer(_deviceWidth, _deviceHeight, image, title, price,
    BuildContext context, image2, disc, rating, sold) {
  return Padding(
    padding: EdgeInsets.only(),
    child: Column(
      children: [
        Container(
            height: _deviceHeight / 3 * 0.6,
            width: _deviceWidth * 0.45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(image))),
            child: cachedImage(imageUrl: image, borderRadius: 0)),
        Container(
            width: _deviceWidth * 0.45,
            height: _deviceHeight * 0.3 * 0.5,
            child: Padding(
              padding: EdgeInsets.only(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisAlignment: MainAxisAlignment.,

                children: [
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Text(title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            // letterSpacing: 2,
                            fontSize: 15,
                            color: Colors.pink,
                            fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 14, right: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Row(children: [
                              Icon(Icons.star,
                                  color: Colors.yellow[900], size: 20),
                              Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text(
                                    rating.toString(),
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            letterSpacing: 2,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)),
                                  )),
                            ]),
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 5, top: 3),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "₹",
                                      style: TextStyle(
                                        color: Color(0xffff0000),
                                        // fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(),
                                    child: Text(price.toString(),
                                        style: GoogleFonts.roboto(
                                            fontSize: 22,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.w400)),
                                  )
                                ],
                              ))
                        ],
                      )),
                  GestureDetector(
                      onTap: () {
                        List product = [
                          title,
                          image,
                          image2,
                          price,
                          disc,
                          rating,
                          sold
                        ];
                        Provider.of<stateProvider>(context, listen: false)
                            .selectedProduct
                            .insert(0, product);
                        Navigator.pushReplacementNamed(context, "/productInfo");
                      },
                      child: Padding(
                          padding: EdgeInsets.only(),
                          child: Container(
                              width: _deviceWidth * 0.3,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.pink,
                              )),
                              child: Center(
                                  child: Text("Get Now",
                                      style: GoogleFonts.robotoMono(
                                          fontSize: 15,
                                          color: Colors.pink,
                                          fontWeight: FontWeight.w500))))))
                ],
              ),
            ))
      ],
    ),
  );
}
