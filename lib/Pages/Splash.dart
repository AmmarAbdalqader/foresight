import 'package:flutter/material.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:core';
import 'package:lottie/lottie.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "SignIn");
    });
    return Scaffold(
      backgroundColor: primaryColor.withOpacity(0.5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "Foresight",
              style: GoogleFonts.jockeyOne(
                color: white,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            Spacer(),
            Lottie.asset("assets/lottie/loadingDots.json", width: 200),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
