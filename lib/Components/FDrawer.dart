import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:google_fonts/google_fonts.dart';

class FDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: mainColor,
      child: ListView(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.symmetric(vertical: mainPadding, horizontal: 8),
        children: [
          SizedBox(
            height: 50,
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
            onTap: () => Navigator.pushReplacementNamed(context, "SignIn"),
            leading: Icon(
              Icons.logout,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
