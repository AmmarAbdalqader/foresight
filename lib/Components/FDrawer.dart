import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foresight/Components/ExitDialog.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class FDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [mainColor, primaryColor],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              height: 120,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 28),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.person_crop_circle,
                        color: white,
                        size: 55,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                          "Ammar",
                          style: GoogleFonts.jockeyOne(
                            color: white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: white,
              endIndent: 15,
              indent: 15,
              height: 25,
            ),
            ListTile(
              title: Text(
                "OtherLang".tr(),
                style: GoogleFonts.jockeyOne(
                  fontSize: 25,
                  color: white,
                ),
              ),
              onTap: () async {
                if ("CurrLang".tr() == "ar") {
                  await context.setLocale(Locale('en', 'JO'));
                } else {
                  await context.setLocale(Locale('ar', 'JO'));
                }
              },
              leading: Icon(
                Icons.translate,
                color: white,
              ),
            ),
            ListTile(
              title: Text(
                "SignOut".tr(),
                style: GoogleFonts.jockeyOne(
                  fontSize: 25,
                  color: white,
                ),
              ),
              onTap: () async => await ExitDialog(
                  context,
                  "AreYouSureToSignOut",
                  "WeWillMissYou!",
                  () => Navigator.pushReplacementNamed(context, "SignIn"),
                  "SignOut"),
              leading: Icon(
                Icons.logout,
                color: white,
              ),
            ),
            Spacer(),
            Center(
              child: Text(
                "Designed by AKA",
                style: GoogleFonts.jockeyOne(
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
