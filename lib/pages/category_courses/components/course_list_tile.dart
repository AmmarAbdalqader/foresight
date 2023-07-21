import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:foresight/constants/flip_locale.dart';
import 'package:foresight/models/category_sub.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'package:foresight/routes/app_pages.dart';

class CourseListTile extends StatelessWidget {
  const CourseListTile({
    super.key,
    required this.categorySub,
  });
  final CategorySub categorySub;

  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      child: CupertinoListTile(
        onTap: () =>
            Get.toNamed(AppPages.courseDetailsView, arguments: categorySub),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                FlipLocale.isLocaleAr()
                    ? categorySub.nameAR
                    : categorySub.nameEN,
                style: const TextStyle(
                  fontSize: 18,
                  color: black,
                ),
              ),
            ),
            RatingBar.builder(
              initialRating: doubleInRange(Random(), 0.5, 5),
              // minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              ignoreGestures: true,
              itemSize: 15,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (double value) {},
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              FlipLocale.isLocaleAr() ? categorySub.nameAR : categorySub.nameEN,
              style: const TextStyle(
                fontSize: 14,
                color: black54,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              children: [
                Icon(
                  CupertinoIcons.person_alt,
                  size: 20,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Ammar Abdalqader", // tutor
                  style: TextStyle(
                    fontSize: 12,
                    color: black54,
                  ),
                ),
              ],
            ),
          ],
        ),
        leading: Lottie.asset("assets/lottie/${categorySub.icon}"),
        leadingSize: 50,
      ),
    );
  }
}
