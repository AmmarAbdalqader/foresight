import 'package:foresight/controllers/categories_con.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foresight/pages/home/components/skeleton_categories.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:foresight/constants/flip_locale.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesCon controller = Get.find();
    return Obx(
      () => SizedBox(
        height: 320,
        width: 1.sw,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2 * mainPadding,
                horizontal: mainPadding,
              ),
              child: Row(
                children: [
                  Text(
                    "OurCategories".tr,
                    style: GoogleFonts.tajawal(
                      fontSize: 25,
                      color: niceGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            controller.loading.isTrue
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
                      itemCount: controller.categories.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () => controller.navigateToCategorySub(index),
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
                                      "assets/lottie/${controller.categories[index].icon}",
                                      width: 200,
                                      repeat: false,
                                      animate: false,
                                    ),
                                  ),
                                  Text(
                                    FlipLocale.isLocaleAr()
                                        ? controller.categories[index].nameAR
                                        : controller.categories[index].nameEN,
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
      ),
    );
  }
}
