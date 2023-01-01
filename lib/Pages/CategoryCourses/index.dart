import 'package:flutter/material.dart';
import 'package:foresight/Components/FAppBar.dart';
import 'package:foresight/Components/SearchField.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:foresight/Components/CourseListTile.dart';

class CategoryCourses extends StatelessWidget {
  CategoryCourses({required this.lesson});

  final String lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
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
              OnPress: () {},
            ),
          ),
          Expanded(
            child: ListView.separated(
              clipBehavior: Clip.antiAlias,
              physics: BouncingScrollPhysics(),
              itemCount: 15,
              separatorBuilder: (context, index) => Divider(
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
