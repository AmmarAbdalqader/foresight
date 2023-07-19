import 'package:get/get.dart';
import 'package:foresight/controllers/categories_con.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoriesCon(), permanent: true);
  }
}
