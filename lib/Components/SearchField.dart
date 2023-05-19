import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/FColors.dart';

class SearchField extends StatelessWidget {
  final String hint;
  final Color colorBTN;
  final VoidCallback onPress;

  const SearchField({
    super.key,
    required this.colorBTN,
    required this.onPress,
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
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: Offset(2, 4),
            spreadRadius: 3,
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint.tr,
          icon: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: colorBTN,
            ),
            child: IconButton(
              onPressed: onPress,
              icon: const Icon(Icons.search, color: white),
            ),
          ),
        ),
        style: GoogleFonts.tajawal(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
