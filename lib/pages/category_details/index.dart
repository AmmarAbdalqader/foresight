import 'package:foresight/constants/flip_locale.dart';
import 'package:foresight/models/categories.dart';
import 'package:foresight/pages/category_details/components/category_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:foresight/components/app_app_bar.dart';

class CategoryDetailsView extends StatelessWidget {
  final Categories category = Get.arguments[0];
  final List<String> categoryList = Get.arguments[1];

  CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kBottomNavigationBarHeight),
        child: FAppBar(
            title: FlipLocale.isLocaleAr() ? category.nameAR : category.nameEN,
            showUserPhoto: false),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 5,
              ),
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.antiAlias,
              shrinkWrap: true,
              itemBuilder: (context, index) => CategoryCard(
                card: categoryList[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
