import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foresight/components/exit_dialog.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:foresight/constants/flip_locale.dart';
import 'package:foresight/controllers/user_con.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import '../constants/app_config.dart';

class FDrawer extends StatelessWidget {
  const FDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    UserCon userCon = Get.find();
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [mainColor, primaryColor],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 28),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Get.toNamed("/ProfileView"),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          clipBehavior: Clip.antiAlias,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: userCon.user?.photo != null
                              ? Image(
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
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator.adaptive(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                )
                              : const Icon(
                                  CupertinoIcons.person_crop_circle,
                                  color: Colors.white,
                                  size: 35,
                                ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            userCon.user!.name,
                            style: GoogleFonts.tajawal(
                              color: white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: white,
              endIndent: 15,
              indent: 15,
              height: 25,
            ),
            ListTile(
              title: Text(
                "Favorites".tr,
                style: GoogleFonts.tajawal(
                  fontSize: 20,
                  color: white,
                ),
              ),
              onTap: () async {},
              leading: const Icon(
                Icons.favorite,
                color: danger,
              ),
            ),
            ListTile(
              title: Text(
                "OtherLang".tr,
                style: GoogleFonts.tajawal(
                  fontSize: 20,
                  color: white,
                ),
              ),
              onTap: () => FlipLocale.flipLocale(),
              leading: const Icon(
                Icons.translate,
                color: white,
              ),
            ),
            ListTile(
              title: Text(
                "SignOut".tr,
                style: GoogleFonts.tajawal(
                  fontSize: 20,
                  color: white,
                ),
              ),
              onTap: () async => await exitDialog(
                context,
                "AreYouSureToSignOut",
                "WeWillMissYou!",
                () async => await userCon.signOut(),
                "SignOut",
              ),
              leading: const Icon(
                Icons.logout,
                color: white,
              ),
            ),
            const Spacer(),
            Center(
              child: Text(
                "Designed by AKA",
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
