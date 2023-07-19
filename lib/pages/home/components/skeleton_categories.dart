import 'package:flutter/material.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonCategories extends StatelessWidget {
  const SkeletonCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          padding: const EdgeInsets.all(110),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: white,
          ),
        ),
      ),
    );
  }
}
