import 'package:foresight/controllers/user_con.dart';
import 'package:get/get.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(/*() =>*/ UserCon(), permanent: true);
  }
}
