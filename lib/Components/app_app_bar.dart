import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foresight/Constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FAppBar extends StatelessWidget {
  const FAppBar({super.key, this.showUserPhoto = true});

  final bool showUserPhoto;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mainColor,
      title: Text(
        "Foresight",
        style: GoogleFonts.tajawal(
          color: white,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      centerTitle: true,
      actions: [
        Visibility(
          visible: showUserPhoto,
          child: IconButton(
            onPressed: () => Get.toNamed("/ProfileView"),
            icon: const Icon(
              CupertinoIcons.person_crop_circle,
              color: white,
              size: 35,
            ),
          ),
        )
      ],
    );
  }
}
