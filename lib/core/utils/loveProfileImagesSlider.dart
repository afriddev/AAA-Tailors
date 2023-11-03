import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'cachedImage.dart';

import '../screens/homeScreenData.dart';

class imagesSlider extends StatefulWidget {
  const imagesSlider({Key? key}) : super(key: key);

  @override
  State<imagesSlider> createState() => _imagesSliderState();
}

class _imagesSliderState extends State<imagesSlider> {
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    var _deviceHeight = MediaQuery.of(context).size.height;

    return SizedBox(
        height: _deviceHeight * 0.2,
        width: _deviceWidth * 0.5,
        child: CarouselSlider.builder(
            itemCount: SisterHoodImages.length,
            itemBuilder: (context, index, realindex) => Padding(
                padding: EdgeInsets.only(),
                child: ImageContainer(
                    _deviceWidth, _deviceHeight, SisterHoodImages[index])),
            options: CarouselOptions(
              autoPlay: true,
              initialPage: 0,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
            )));
  }

  Widget ImageContainer(width, height, imageUrl) {
    return Container(
      width: width * 0.4,
      height: height * 0.2,
      child: cachedImage(imageUrl: imageUrl, borderRadius: 10),
    );
  }
}
