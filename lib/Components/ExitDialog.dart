import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:google_fonts/google_fonts.dart';

Future ExitDialog(context, String title, String subTitle, VoidCallback onClick,
    String okBTN) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: eeeeee,
        title: Center(child: Text(title.tr())),
        titleTextStyle: GoogleFonts.jockeyOne(
          fontSize: 25,
          color: black,
        ),
        contentPadding: EdgeInsets.all(35),
        content: Text(
          subTitle.tr(),
          textAlign: TextAlign.center,
        ),
        contentTextStyle: GoogleFonts.jockeyOne(
          fontSize: 20,
          color: black54,
        ),
        actions: [
          ElevatedButton(
            child: Text(
              okBTN.tr(),
              style: GoogleFonts.jockeyOne(
                fontSize: 20,
                color: white,
              ),
            ),
            onPressed: onClick,
            style: ElevatedButton.styleFrom(
              backgroundColor: success,
            ),
          ),
          ElevatedButton(
            child: Text(
              'Cancel'.tr(),
              style: GoogleFonts.jockeyOne(
                fontSize: 20,
                color: white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: danger,
            ),
          ),
        ],
      );
    },
  );
}
