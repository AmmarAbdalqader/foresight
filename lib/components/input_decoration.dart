import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

InputDecoration inputDecoration(String hint, IconData icon) => InputDecoration(
      icon: Icon(icon),
      iconColor: black54,
      errorStyle: const TextStyle(
        fontSize: 12,
      ),
      border: InputBorder.none,
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: mainColor,
          width: 2.5,
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: black54,
        ),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: danger,
        ),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: danger,
        ),
      ),
      hintText: hint.tr,
    );
