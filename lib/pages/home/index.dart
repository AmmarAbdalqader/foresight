import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foresight/components/exit_dialog.dart';
import 'package:foresight/components/app_app_bar.dart';
import 'package:foresight/components/app_drawer.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:foresight/components/poster_slider.dart';
import 'package:foresight/controllers/categories_con.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'components/categories_widget.dart';
import 'components/header_widget.dart';

class HomeView extends GetView<CategoriesCon> {
  const HomeView({super.key});

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
    // return DefaultTabController(
    //   initialIndex: 2,
    //   animationDuration: const Duration(seconds: 1),
    //   length: 4,
    //   child: Scaffold(
    //     bottomNavigationBar: SizedBox(
    //       height: kBottomNavigationBarHeight,
    //       child: AppBar(
    //         backgroundColor: Colors.amber,
    //         bottom: const TabBar(
    //           indicatorPadding:
    //               EdgeInsets.symmetric(horizontal: 12, vertical: 2),
    //           indicatorColor: mainColor,
    //           dividerColor: mainColor,
    //           unselectedLabelColor: white,
    //           labelColor: mainColor,
    //           tabs: [
    //             Tab(icon: Icon(Icons.directions_car)),
    //             Tab(icon: Icon(Icons.directions_transit)),
    //             Tab(icon: Icon(Icons.directions_bike)),
    //             Tab(icon: Icon(Icons.directions_car)),
    //           ],
    //         ),
    //       ),
    //     ),
    //     body: const TabBarView(
    //       physics: NeverScrollableScrollPhysics(),
    //       children: [
    //         Icon(Icons.directions_car),
    //         Icon(Icons.directions_transit),
    //         Icon(Icons.directions_bike),
    //         Icon(Icons.directions_car),
    //       ],
    //     ),
    //   ),
    // );
  }
}
