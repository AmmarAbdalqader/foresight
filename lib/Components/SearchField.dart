import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/FColors.dart';

class SearchField extends StatelessWidget {
  final String hint;
  final Color colorBTN;
  final VoidCallback OnPress;

  SearchField({
    required this.colorBTN,
    required this.OnPress,
    this.hint = "Search...",
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 0.85.sw,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint.tr(),
          icon: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: colorBTN,
            ),
            child: IconButton(
              onPressed: OnPress,
              icon: Icon(Icons.search, color: white),
            ),
          ),
        ),
        style: GoogleFonts.jockeyOne(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
