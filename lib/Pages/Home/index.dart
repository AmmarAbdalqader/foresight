import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foresight/Components/ExitDialog.dart';
import 'package:foresight/Components/FAppBar.dart';
import 'package:foresight/Components/FDrawer.dart';
import 'package:foresight/Components/SearchField.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:foresight/Constants/mainLists.dart';
import 'package:foresight/Pages/CategoryDetails/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:foresight/Components/PosterSlider.dart';

class HomePage extends StatelessWidget {
  Widget HeaderWidget(context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(mainPadding),
            width: 1.sw,
            height: 280,
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
                    fontSize: 18,
                    color: greyText,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 0.6.sw,
                      height: 160,
                      child: Lottie.asset('assets/lottie/Elearning.json'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: SearchField(
                colorBTN: success,
                OnPress: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget CategoriesWidget(context) {
    return Container(
      height: 375,
      width: 1.sw,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "OurCategories".tr(),
              style: GoogleFonts.jockeyOne(
                fontSize: 25,
                color: white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.antiAlias,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: categoriesLottie.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetails(
                          category: categoriesLottie[index],
                          categoryList: allLottie[index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Lottie.asset(
                              "assets/lottie/" + categoriesLottie[index],
                              width: 200,
                            ),
                          ),
                          Text(
                            categoriesLottie[index].split(".")[0].tr(),
                            style: GoogleFonts.jockeyOne(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  Widget WallpaperWidget(context) {
    return Container(
      width: 1.sw,
      child: Image(
        image: AssetImage("assets/images/foresight.jpg"), //  chart.png
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await ExitDialog(
          context,
          "AreYouSureToExit",
          "WeWillMissYou!",
          () => exit(0),
          'Exit',
        );
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: FAppBar(),
        ),
        drawer: FDrawer(),
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(context),
              CategoriesWidget(context),
              PosterSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
