import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foresight/Components/ExitDialog.dart';
import 'package:foresight/Components/FAppBar.dart';
import 'package:foresight/Components/FDrawer.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:foresight/Components/PosterSlider.dart';
import 'package:foresight/GetControllers/categories_con.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'components/categories_widget.dart';
import 'components/header_widget.dart';

class HomePage extends GetView<CategoriesCon> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesCon(), permanent: true);
    return WillPopScope(
      onWillPop: () async {
        return await exitDialog(
          context,
          "AreYouSureToExit",
          "WeWillMissYou!",
          () async {
            final storage = GetStorage();
            await storage.write("UserID", 0);
            exit(0);
          },
          'Exit',
        );
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kBottomNavigationBarHeight),
          child: FAppBar(),
        ),
        drawer: const FDrawer(),
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              headerWidget(),
              categoriesWidget(),
              const PosterSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
