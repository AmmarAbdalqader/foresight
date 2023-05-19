import 'package:flutter/material.dart';
import 'package:foresight/Components/FAppBar.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:foresight/Components/PosterSlider.dart';

class CourseDetails extends StatelessWidget {
  CourseDetails({super.key});

  final String lesson = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kBottomNavigationBarHeight),
        child: FAppBar(),
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const PosterSlider(),
            Lottie.asset("assets/lottie/$lesson"),
          ],
        ),
      ),
    );
  }
}
