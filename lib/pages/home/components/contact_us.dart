import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:foresight/constants/app_colors.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: mainPadding),
      height: 200,
      color: eeeeee,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: mainPadding),
                      child: Text(
                        "ContactUs".tr,
                        style: GoogleFonts.tajawal(
                          fontSize: 24,
                          color: black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: mainPadding),
                      child: SelectableText(
                        "foresight.elearning@aka.com",
                        style: GoogleFonts.tajawal(
                          fontSize: 16,
                          color: black54,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: mainPadding),
                      child: SelectableText(
                        "+962776311665",
                        style: GoogleFonts.tajawal(
                          fontSize: 16,
                          color: black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Lottie.asset(
                  'assets/lottie/contactUs.json',
                  height: 160,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
