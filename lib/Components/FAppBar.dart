import 'package:flutter/material.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class FAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mainColor,
      title: Text(
        "Foresight",
        style: GoogleFonts.jockeyOne(
          color: white,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.person_crop_circle,
            color: white,
            size: 35,
          ),
        )
      ],
    );
  }
}
