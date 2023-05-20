import 'package:flutter/material.dart';
import 'package:foresight/Components/app_app_bar.dart';
import 'package:foresight/Constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:foresight/Components/poster_slider.dart';

class CourseDetailsView extends StatelessWidget {
  CourseDetailsView({super.key});

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
