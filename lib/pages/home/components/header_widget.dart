import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:foresight/components/search_field.dart';
import 'package:foresight/constants/app_colors.dart';

Widget headerWidget() {
  return SizedBox(
    height: 300,
    child: Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(mainPadding),
          width: 1.sw,
          height: 280,
          color: primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "LearnEveryThing".tr,
                style: GoogleFonts.tajawal(
                  fontSize: 30,
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "HereInForesight".tr,
                style: GoogleFonts.tajawal(
                  fontSize: 20,
                  color: greyText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 0.6.sw,
                    height: 160,
                    child: Lottie.asset('assets/lottie/Elearning.json'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: SearchField(
              colorBTN: success,
              onPress: () {},
            ),
          ),
        ),
      ],
    ),
  );
}
