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

  CategoryDetails({required this.category, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: FAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            category.tr(),
            style: GoogleFonts.jockeyOne(
              fontSize: 30,
              color: primaryColor,
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
                    borderRadius: BorderRadius.circular(50), color: black54),
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 5,
              ),
              physics: BouncingScrollPhysics(),
              clipBehavior: Clip.antiAlias,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () {
                    InfoDialog(context, categoryList[index]);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(12),
                    height: 50,
                    width: 26,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: black54),
                      boxShadow: [
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
                            "assets/lottie/" + categoryList[index],
                            width: 200,
                          ),
                        ),
                        Text(
                          categoryList[index].split(".")[0],
                          style: GoogleFonts.jockeyOne(fontSize: 22),
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
