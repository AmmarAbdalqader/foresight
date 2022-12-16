import 'package:flutter/material.dart';
import 'package:foresight/Constants/FColors.dart';

class FAppBar extends StatelessWidget {
  const FAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.person_pin,
            color: white,
          ),
        )
      ],
    );
  }
}
