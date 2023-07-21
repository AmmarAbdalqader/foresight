import 'package:flutter/material.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:foresight/constants/flip_locale.dart';
import 'package:foresight/models/category_sub.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

Future infoDialog(context, CategorySub categorySub) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: eeeeee,
        title: Center(
          child: Text(
            FlipLocale.isLocaleAr() ? categorySub.nameAR : categorySub.nameEN,
          ),
        ),
        titleTextStyle: GoogleFonts.tajawal(
          fontSize: 25,
          color: black,
        ),
        contentPadding: const EdgeInsets.all(35),
        content: Lottie.asset("assets/lottie/${categorySub.icon}"),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () => Get.back(),
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
