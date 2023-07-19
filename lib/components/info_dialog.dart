import 'package:flutter/material.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

Future infoDialog(context, String lesson) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: eeeeee,
        title: Center(
          child: Text(lesson.split(".")[0]),
        ),
        titleTextStyle: GoogleFonts.tajawal(
          fontSize: 25,
          color: black,
        ),
        contentPadding: const EdgeInsets.all(35),
        content: Lottie.asset("assets/lottie/$lesson"),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () => Get.back(),
            // },
            style: ElevatedButton.styleFrom(
              backgroundColor: niceGrey,
            ),
            child: Text(
              'OK'.tr,
              style: GoogleFonts.tajawal(
                fontSize: 20,
                color: white,
              ),
            ),
          ),
        ],
      );
    },
  );
}
