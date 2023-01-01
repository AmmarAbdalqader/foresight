import 'package:flutter/material.dart';
import 'package:foresight/Components/FAppBar.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:lottie/lottie.dart';
import 'package:foresight/Components/PosterSlider.dart';

class CourseDetails extends StatelessWidget {
  CourseDetails({required this.lesson});

  final String lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: FAppBar(),
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [PosterSlider(), Lottie.asset("assets/lottie/" + lesson)],
        ),
      ),
    );
  }
}
