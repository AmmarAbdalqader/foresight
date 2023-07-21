import 'package:flutter/material.dart';
import 'package:foresight/components/app_app_bar.dart';
import 'package:foresight/components/search_field.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:foresight/constants/flip_locale.dart';
import 'package:foresight/models/category_sub.dart';
import 'package:foresight/pages/category_courses/components/course_list_tile.dart';
import 'package:get/get.dart';

class CategoryCoursesView extends StatelessWidget {
  CategoryCoursesView({super.key});

  final CategorySub categorySub = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kBottomNavigationBarHeight),
        child: FAppBar(
          title:
              FlipLocale.isLocaleAr() ? categorySub.nameAR : categorySub.nameEN,
        ),
      ),
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: SearchField(
              colorBTN: mainColor,
              onPress: () {},
            ),
          ),
          Expanded(
            child: ListView.separated(
              clipBehavior: Clip.antiAlias,
              physics: const BouncingScrollPhysics(),
              itemCount: 15,
              separatorBuilder: (context, index) => Divider(
                color: greyText,
                indent: 35,
                endIndent: 35,
              ),
              itemBuilder: (context, index) {
                return CourseListTile(
                  categorySub: categorySub,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
