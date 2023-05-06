import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foresight/Components/ExitDialog.dart';
import 'package:foresight/Components/FAppBar.dart';
import 'package:foresight/Components/FDrawer.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:foresight/Components/PosterSlider.dart';
import 'package:foresight/Controllers/categoriesCon.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/categories_widget.dart';
import 'components/header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoriesCon>(
      create: (_) => CategoriesCon(context),
      builder: (_, child) {
        return Consumer<CategoriesCon>(
          builder: (_, prov, __) {
            return WillPopScope(
              onWillPop: () async {
                return await exitDialog(
                  context,
                  "AreYouSureToExit",
                  "WeWillMissYou!",
                  () {
                    SharedPreferences.getInstance().then((sp) {
                      sp.setInt("UserID", 0);
                    });
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
                      headerWidget(context),
                      categoriesWidget(context),
                      const PosterSlider(),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
