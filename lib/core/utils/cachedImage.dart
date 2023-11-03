import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class cachedImage extends StatefulWidget {
  cachedImage({Key? key, required this.imageUrl, required this.borderRadius})
      : super(key: key);
  String imageUrl;
  double borderRadius;

  @override
  State<cachedImage> createState() => _cachedImageState();
}

class _cachedImageState extends State<cachedImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(widget.borderRadius),
        image:DecorationImage(
          fit:BoxFit.fill,
          image:NetworkImage(
            widget.imageUrl
          )
        )
      ),
    );

  }
}
