import 'package:foresight/Constants/flip_locale.dart';
import 'package:foresight/Models/categories.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:foresight/Components/app_app_bar.dart';
import 'package:foresight/Components/info_dialog.dart';
import 'package:foresight/Constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CategoryDetailsView extends StatelessWidget {
  final Categories category = Get.arguments[0];
  final List<String> categoryList = Get.arguments[1];

  CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kBottomNavigationBarHeight),
        child: FAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            FlipLocale.isLocaleAr() ? category.nameAR : category.nameEN,
            style: GoogleFonts.tajawal(
              fontSize: 26,
              color: primaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Divider(
            height: 35,
            color: black54,
            endIndent: 30,
            indent: 30,
            thickness: 3.8,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 5,
              ),
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.antiAlias,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                /// TODO make this a component
                return GestureDetector(
                  onLongPress: () {
                    infoDialog(context, categoryList[index]);
                  },
                  onTap: () {
                    Get.toNamed("/CategoryCoursesView",
                        arguments: categoryList[index]);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(12),
                    height: 50,
                    width: 26,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: black54),
                      boxShadow: const [
                        BoxShadow(
                          color: black54,
                          spreadRadius: 1,
                          offset: Offset(3, 6),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Lottie.asset(
                            "assets/lottie/${categoryList[index]}",
                            width: 200,
                          ),
                        ),
                        Text(
                          categoryList[index].split(".")[0],
                          style: GoogleFonts.tajawal(
                            fontSize: 22,
                            color: black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
