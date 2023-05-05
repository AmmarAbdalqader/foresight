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
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget headerWidget(context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(mainPadding),
            width: 1.sw,
            height: 280,
            color: primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "LearnEveryThing".tr(),
                  style: GoogleFonts.tajawal(
                    fontSize: 30,
                    color: white,
                  ),
                ),
                Text(
                  "HereInForesight".tr(),
                  style: GoogleFonts.tajawal(
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
                onPress: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget categoriesWidget(context) {
    return SizedBox(
      height: 375,
      width: 1.sw,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "OurCategories".tr(),
              style: GoogleFonts.tajawal(
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
              physics: const BouncingScrollPhysics(),
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
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Lottie.asset(
                              "assets/lottie/${categoriesLottie[index]}",
                              width: 200,
                            ),
                          ),
                          Text(
                            categoriesLottie[index].split(".")[0].tr(),
                            style: GoogleFonts.tajawal(
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
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  Widget wallpaperWidget(context) {
    return SizedBox(
      width: 1.sw,
      child: const Image(
        image: AssetImage("assets/images/foresight.jpg"), //  chart.png
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await exitDialog(
          context,
          "AreYouSureToExit",
          "WeWillMissYou!",
          () {
            SharedPreferences.getInstance().then((sp) {
              sp.setInt("UserID", 0);
            });
            exit(0);
          },
          'Exit',
        );
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kBottomNavigationBarHeight),
          child: FAppBar(),
        ),
        drawer: const FDrawer(),
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              headerWidget(context),
              categoriesWidget(context),
              const PosterSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
