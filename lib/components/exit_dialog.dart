import 'package:flutter/material.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future exitDialog(BuildContext context, String title, String subTitle,
    VoidCallback onClick, String okBTN) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text(title.tr)),
        titleTextStyle: GoogleFonts.tajawal(
          fontSize: 25,
          color: black,
        ),
        contentPadding: const EdgeInsets.all(35),
        content: Text(
          subTitle.tr,
          textAlign: TextAlign.center,
        ),
        contentTextStyle: GoogleFonts.tajawal(
          fontSize: 20,
          color: black54,
        ),
        actions: [
          ElevatedButton(
            onPressed: onClick,
            child: Text(
              okBTN.tr,
            ),
          ),
          TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(
              foregroundColor: black54,
            ),
            child: Text(
              'Cancel'.tr,
            ),
          ),
        ],
      );
    },
  );
}
