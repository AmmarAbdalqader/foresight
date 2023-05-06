import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foresight/Pages/Home/components/skeleton_categories.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../Constants/FColors.dart';
import '../../../Constants/mainLists.dart';
import '../../../Controllers/categoriesCon.dart';
import '../../CategoryDetails/index.dart';

Widget categoriesWidget(BuildContext context) {
  return Consumer<CategoriesCon>(
    builder: (_, prov, __) {
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
            prov.loading
                ? Expanded(
                    key: const ValueKey(1),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.antiAlias,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (_, __) => const SkeletonCategories(),
                    ),
                  )
                : Expanded(
                    key: const ValueKey(2),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.antiAlias,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: prov.categories.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryDetails(
                                  category: prov.categories[index].nameEN,
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
                                      "assets/lottie/${prov.categories[index].icon}",
                                      width: 200,
                                    ),
                                  ),
                                  Text(
                                    context.locale.languageCode == "ar"
                                        ? prov.categories[index].nameAR
                                        : prov.categories[index].nameEN,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 18,
                                      color: black,
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
    },
  );
}
