import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foresight/Components/FAppBar.dart';
import 'package:foresight/Components/InfoDialog.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CategoryDetails extends StatelessWidget {
  final String category;
  final List<String> categoryList;

  const CategoryDetails(
      {super.key, required this.category, required this.categoryList});

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
            height: 15,
          ),
          Text(
            category.tr(),
            style: GoogleFonts.tajawal(
              fontSize: 26,
              color: primaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: black54,
                ),
                child: SizedBox(
                  height: 5,
                  width: .85.sw,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
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
                return GestureDetector(
                  onLongPress: () {
                    infoDialog(context, categoryList[index]);
                  },
                  onTap: () {
                    Navigator.pushNamed(context, "CategoryCourses",
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
