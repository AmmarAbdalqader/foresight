import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:foresight/controllers/user_con.dart';
import 'package:foresight/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foresight/constants/app_config.dart';

class FAppBar extends StatelessWidget {
  const FAppBar(
      {super.key,
      required this.title,
      this.showUserPhoto = true,
      this.elevation = 8});

  final String title;
  final bool showUserPhoto;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    UserCon userCon = Get.find();
    return AppBar(
      elevation: elevation,
      title: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          title,
          style: GoogleFonts.tajawal(
            color: white,
            letterSpacing: 2,
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
      ),
      actions: [
        Visibility(
          visible: showUserPhoto,
          child: InkWell(
            onTap: () => Get.toNamed(AppPages.profile),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image(
                image: NetworkImage(
                  "${AppConfig.images}/${userCon.user!.photo}",
                ),
                errorBuilder: (context, e, stackTrace) {
                  log(e.toString());
                  log(stackTrace.toString());
                  return const Icon(
                    CupertinoIcons.person_crop_circle,
                    color: white,
                    size: 35,
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator.adaptive(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                      backgroundColor: mainOldColor,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
