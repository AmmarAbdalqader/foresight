import 'package:flutter/material.dart';
import 'package:foresight/components/app_app_bar.dart';
import 'package:foresight/components/search_field.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:foresight/pages/category_courses/components/course_list_tile.dart';
import 'package:get/get.dart';

class CategoryCoursesView extends StatelessWidget {
  CategoryCoursesView({super.key});

  final String lesson = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kBottomNavigationBarHeight),
        child: FAppBar(),
      ),
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: SearchField(
              colorBTN: success,
              onPress: () {},
            ),
          ),
          Expanded(
            child: ListView.separated(
              clipBehavior: Clip.antiAlias,
              physics: const BouncingScrollPhysics(),
              itemCount: 15,
              separatorBuilder: (context, index) => const Divider(
                color: black54,
                indent: 35,
                endIndent: 35,
              ),
              itemBuilder: (context, index) {
                return CourseListTile(
                  lesson: lesson,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
