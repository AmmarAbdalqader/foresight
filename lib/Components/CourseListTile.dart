import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';

class CourseListTile extends StatelessWidget {
  const CourseListTile({
    super.key,
    required this.lesson,
  });
  final String lesson;

  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      child: ListTile(
        onTap: () {
          Get.toNamed("/CourseDetails", arguments: lesson);
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                lesson.split(".")[0],
                style: const TextStyle(
                  fontSize: 20,
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
              lesson.split(".")[0],
              style: const TextStyle(
                fontSize: 16,
                color: black54,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: const [
                Icon(
                  Icons.person,
                  size: 20,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Ammar Abdalqader", // tutor
                  style: TextStyle(
                    fontSize: 15,
                    color: black54,
                  ),
                ),
              ],
            ),
          ],
        ),
        leading: Lottie.asset("assets/lottie/$lesson"),
        horizontalTitleGap: 1.2,
        isThreeLine: true,
        contentPadding: const EdgeInsets.all(12),
        visualDensity: const VisualDensity(
          vertical: VisualDensity.maximumDensity,
          horizontal: VisualDensity.maximumDensity,
        ),
        minVerticalPadding: 20,
      ),
    );
  }
}
