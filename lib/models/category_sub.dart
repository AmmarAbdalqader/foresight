import 'dart:convert';
import 'package:foresight/constants/app_config.dart';
import 'package:foresight/helpers/api_endpoints.dart';
import 'package:foresight/helpers/http.dart';
import 'package:get/get.dart';
import 'package:foresight/constants/app_colors.dart';

class CategorySub {
  final int id;
  final int categoryID;
  final String nameAR;
  final String nameEN;
  final String icon;

  CategorySub({
    required this.id,
    required this.categoryID,
    required this.nameAR,
    required this.nameEN,
    required this.icon,
  });

  factory CategorySub.fromJson(Map json) => CategorySub(
        id: json["ID"],
        categoryID: json["CategoryID"],
        nameAR: json["NameAR"],
        nameEN: json["NameEN"],
        icon: json["Icon"],
      );

  static Future<List<CategorySub>> getCategorySub(int categoryID) async {
    /// categoryID == 0 ? get all CategorySubs
    List<CategorySub> list = [];
    try {
      var res =
          await HTTP.get("${AppConfig.url}${API.getCategoriesSub}/$categoryID");
      if (res.statusCode == 200) {
        list = (json.decode(utf8.decode(res.bodyBytes)) as List)
            .map((e) => CategorySub.fromJson(e))
            .toList();
      }
    } catch (e) {
      Get.snackbar('AnErrorHasOccurred', 'CheckYourInternet',
          backgroundColor: danger, duration: const Duration(seconds: 5));
    }
    return list;
  }
}
