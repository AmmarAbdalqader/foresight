import 'package:flutter/material.dart';
import 'package:foresight/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:foresight/components/info_dialog.dart';
import 'package:foresight/constants/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.card}) : super(key: key);

  final String card;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => infoDialog(context, card),
      onTap: () {
        Get.toNamed(AppPages.categoryCourses, arguments: card);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: black54.withOpacity(0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: black54.withOpacity(0.2),
              spreadRadius: 1,
              offset: const Offset(3, 6),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Lottie.asset(
                "assets/lottie/$card",
              ),
            ),
            const Spacer(),
            Text(
              card.split(".")[0],
              style: GoogleFonts.tajawal(
                fontSize: 20,
                color: black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
