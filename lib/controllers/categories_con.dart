import 'dart:collection';
import 'package:foresight/models/category_sub.dart';
import 'package:get/get.dart';
import '../models/categories.dart';
import '../routes/app_pages.dart';

class CategoriesCon extends GetxController {
  RxBool loading = false.obs;
  RxBool loadingSub = false.obs;

  final RxList<Categories> _categories = <Categories>[].obs;
  final RxList<CategorySub> _categorySub = <CategorySub>[].obs;

  UnmodifiableListView<Categories> get categories =>
      UnmodifiableListView(_categories);
  UnmodifiableListView<CategorySub> get categorySub =>
      UnmodifiableListView(_categorySub);

  @override
  void onInit() async {
    flipLoading();
    await getCategories(0);
    flipLoading();
    super.onInit();
  }

  void flipLoading() => loading.value = !loading.value;
  void flipLoadingSub() => loadingSub.value = !loadingSub.value;

  Future<void> getCategories(int categoryID) async {
    _categories.value = await Categories.getCategories(categoryID);
  }

  void navigateToCategorySub(int index) async {
    await getCategoriesSub(_categories[index].id);
    Get.toNamed(
      AppPages.categoryDetails,
      arguments: [categories[index]],
    );
  }

  Future<void> getCategoriesSub(int categoryID) async {
    flipLoadingSub();
    _categorySub.clear();
    _categorySub.value = await CategorySub.getCategorySub(categoryID);
    flipLoadingSub();
  }
}
