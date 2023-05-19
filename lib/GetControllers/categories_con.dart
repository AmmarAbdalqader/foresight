import 'package:get/get.dart';
import '../Models/categories.dart';

class CategoriesCon extends GetxController {
  var loading = false.obs;

  var categories = [].obs;

  void setLoading() => loading.value = !loading.value;

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
}
