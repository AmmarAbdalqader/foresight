import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:google_fonts/google_fonts.dart';

Future exitDialog(context, String title, String subTitle, VoidCallback onClick,
    String okBTN) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: eeeeee,
        title: Center(child: Text(title.tr())),
        titleTextStyle: GoogleFonts.tajawal(
          fontSize: 25,
          color: black,
        ),
        contentPadding: const EdgeInsets.all(35),
        content: Text(
          subTitle.tr(),
          textAlign: TextAlign.center,
        ),
        contentTextStyle: GoogleFonts.tajawal(
          fontSize: 20,
          color: black54,
        ),
        actions: [
          ElevatedButton(
            onPressed: onClick,
            style: ElevatedButton.styleFrom(
              backgroundColor: success,
            ),
            child: Text(
              okBTN.tr(),
              style: GoogleFonts.tajawal(
                fontSize: 20,
                color: white,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: danger,
            ),
            child: Text(
              'Cancel'.tr(),
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
