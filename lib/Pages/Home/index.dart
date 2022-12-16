import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foresight/Components/FAppBar.dart';
import 'package:foresight/Components/FDrawer.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  Widget HeaderWidget(context) {
    return Container(
      padding: EdgeInsets.all(mainPadding),
      width: 1.sw,
      height: 0.3.sh,
      color: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "LearnEveryThing".tr(),
            style: GoogleFonts.jockeyOne(
              fontSize: 30,
              color: white,
            ),
          ),
          Text(
            "HereInForesight".tr(),
            style: GoogleFonts.jockeyOne(
              fontSize: 24,
              color: greyText,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 0.6.sw,
                height: 0.18.sh,
                child: Lottie.asset('assets/lottie/Elearning.json'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: FAppBar(),
      ),
      drawer: FDrawer(),
      body: Column(
        children: [
          HeaderWidget(context),
        ],
      ),
    );
  }
}
