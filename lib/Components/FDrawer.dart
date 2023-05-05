import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foresight/Components/ExitDialog.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:foresight/Controllers/UserCon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FDrawer extends StatelessWidget {
  const FDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var userCon = context.read<UserCon>();
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
              height: 15,
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 28),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "profile"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          CupertinoIcons.person_crop_circle,
                          color: white,
                          size: 55,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
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
                "Favorites".tr(),
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
                "OtherLang".tr(),
                style: GoogleFonts.tajawal(
                  fontSize: 20,
                  color: white,
                ),
              ),
              onTap: () async {
                if ("CurrLang".tr() == "ar") {
                  await context.setLocale(const Locale('en', 'JO'));
                } else {
                  await context.setLocale(const Locale('ar', 'JO'));
                }
              },
              leading: const Icon(
                Icons.translate,
                color: white,
              ),
            ),
            ListTile(
              title: Text(
                "SignOut".tr(),
                style: GoogleFonts.tajawal(
                  fontSize: 20,
                  color: white,
                ),
              ),
              onTap: () async => await exitDialog(
                context,
                "AreYouSureToSignOut",
                "WeWillMissYou!",
                () {
                  SharedPreferences.getInstance().then((sp) {
                    sp.setInt("UserID", 0);
                  });
                  Navigator.pushReplacementNamed(context, "SignIn");
                },
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
