import 'package:flutter/material.dart';
import 'package:foresight/Models/categories.dart';

class CategoriesCon extends ChangeNotifier {
  bool loading = false;

  List<Categories> categories = [];

  CategoriesCon(context) {
    getData(context);
  }

  void setLoading() {
    loading = !loading;
    notifyListeners();
  }

  void getData(context) async {
    setLoading();
    await getCategories(context, 0);
    setLoading();
  }

  Future getCategories(context, int categoryID) async {
    categories = await Categories.getCategories(context, categoryID);
  }
}
