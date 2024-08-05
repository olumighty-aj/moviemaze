import 'package:flutter/material.dart';



class CustomCardThumbnail extends StatelessWidget {
  String imageAsset;
   CustomCardThumbnail({super.key, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageAsset), fit: BoxFit.cover)
      ),
    );
  }
}
