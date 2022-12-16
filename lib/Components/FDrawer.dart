import 'package:flutter/material.dart';
import 'package:foresight/Constants/FColors.dart';

class FDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: mainColor,
      child: ListView(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.symmetric(vertical: mainPadding, horizontal: 8),
        children: [],
      ),
    );
  }
}
