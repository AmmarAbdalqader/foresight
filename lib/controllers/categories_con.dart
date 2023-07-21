import 'package:foresight/models/category_sub.dart';
import 'package:get/get.dart';
import '../models/categories.dart';
import '../routes/app_pages.dart';

class CategoriesCon extends GetxController {
  var loading = false.obs;
  var loadingSub = false.obs;

  var categories = [].obs;
  var categorySub = [].obs;

  void setLoading() => loading.value = !loading.value;
  void setLoadingSub() => loadingSub.value = !loadingSub.value;

  @override
  void onInit() async {
    setLoading();
    await getCategories(0);
    setLoading();
    super.onInit();
  }

  Future getCategories(int categoryID) async {
    categories.value = await Categories.getCategories(categoryID);
  }

  void navigateToCategorySub(int index) async {
    await getCategoriesSub(categories[index].id);
    Get.toNamed(
      AppPages.categoryDetails,
      arguments: [categories[index]],
    );
  }

  Future getCategoriesSub(int categoryID) async {
    setLoadingSub();
    categorySub.clear();
    categorySub.value = await CategorySub.getCategorySub(categoryID);
    setLoadingSub();
  }
}
