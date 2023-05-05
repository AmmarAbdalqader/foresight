import 'package:flutter/material.dart';
import 'package:foresight/Components/FAppBar.dart';
import 'package:foresight/Components/SearchField.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:foresight/Components/CourseListTile.dart';

class CategoryCourses extends StatelessWidget {
  const CategoryCourses({super.key, required this.lesson});

  final String lesson;

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
