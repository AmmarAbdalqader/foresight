import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:google_fonts/google_fonts.dart';

class loginFields extends StatelessWidget {
  loginFields({required this.Con, required this.hintText});

  final TextEditingController Con;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Con,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: black54),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: black54),
        ),
        hintText: hintText.tr(),
      ),
      style: GoogleFonts.jockeyOne(
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }
}
