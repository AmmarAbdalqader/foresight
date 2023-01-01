import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:foresight/Constants/FColors.dart';

class PosterSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      height: 250,
      indicatorColor: primaryColor,
      autoPlayInterval: 5000,
      isLoop: true,
      children: [
        Image(image: AssetImage("assets/images/chart.png")),
        Image(image: AssetImage("assets/images/foresight.jpg")),
        Image(image: AssetImage("assets/images/chart.png")),
        Image(image: AssetImage("assets/images/foresight.jpg")),
      ],
    );
  }
}
