import 'package:flutter/material.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:foresight/Controllers/UserCon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:core';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    var userCon = context.watch<UserCon>();
    Future<void>.delayed(const Duration(seconds: 2), () async {
      await userCon.splash(context);
    });
    return Scaffold(
      backgroundColor: primaryColor.withOpacity(0.5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "Foresight",
              style: GoogleFonts.tajawal(
                color: white,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            const Spacer(),
            Lottie.asset("assets/lottie/loadingDots.json", width: 200),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
