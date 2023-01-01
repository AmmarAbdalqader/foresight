import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';

class CourseListTile extends StatelessWidget {
  CourseListTile({
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
          Navigator.pushNamed(context, "CourseDetails", arguments: lesson);
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                lesson.split(".")[0],
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
              itemBuilder: (context, _) => Icon(
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
            SizedBox(
              height: 5,
            ),
            Text(
              lesson.split(".")[0],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 20,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Ammar Abdalqader", // tutor
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        leading: Lottie.asset("assets/lottie/" + lesson),
        horizontalTitleGap: 1.2,
        isThreeLine: true,
        contentPadding: EdgeInsets.all(12),
        visualDensity: VisualDensity(
          vertical: VisualDensity.maximumDensity,
          horizontal: VisualDensity.maximumDensity,
        ),
        minVerticalPadding: 20,
      ),
    );
  }
}
