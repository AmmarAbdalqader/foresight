import 'package:foresight/components/loading_widget.dart';
import 'package:foresight/constants/flip_locale.dart';
import 'package:foresight/models/categories.dart';
import 'package:foresight/pages/category_details/components/category_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:foresight/components/app_app_bar.dart';
import '../../controllers/categories_con.dart';

class CategoryDetailsView extends StatelessWidget {
  final Categories category = Get.arguments[0];

  CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesCon controller = Get.find();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kBottomNavigationBarHeight),
        child: FAppBar(
            title: FlipLocale.isLocaleAr() ? category.nameAR : category.nameEN,
            showUserPhoto: false),
      ),
      body: Obx(
        () => controller.loadingSub.isTrue
            ? const Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: LoadingWidget(),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemCount: controller.categorySub.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 5,
                      ),
                      physics: const BouncingScrollPhysics(),
                      clipBehavior: Clip.antiAlias,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CategoryCard(
                        card: controller.categorySub[index],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
