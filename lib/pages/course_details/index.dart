import 'package:flutter/material.dart';
import 'package:foresight/components/app_app_bar.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:foresight/models/category_sub.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:foresight/components/poster_slider.dart';

class CourseDetailsView extends StatelessWidget {
  CourseDetailsView({super.key});

  final CategorySub categorySub = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kBottomNavigationBarHeight),
        child: FAppBar(title: "Foresight"),
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const PosterSlider(),
            Lottie.asset("assets/lottie/${categorySub.icon}"),
          ],
        ),
      ),
    );
  }
}
