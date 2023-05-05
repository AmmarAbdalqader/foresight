import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../Constants/FColors.dart';
import '../../../Constants/mainLists.dart';
import '../../CategoryDetails/index.dart';

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
