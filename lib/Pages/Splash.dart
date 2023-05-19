import 'package:flutter/material.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:foresight/GetControllers/user_con.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:core';
import 'package:lottie/lottie.dart';

class Splash extends GetView<UserCon> {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserCon(), permanent: true);
    Future.delayed(
      const Duration(seconds: 3),
      () async => await controller.splash(),
    );
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
            const Spacer(
              flex: 3,
            ),
            Lottie.asset(
              "assets/lottie/loadingDots.json",
              width: 200,
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.colorFilter(
                    ['Shape Layer 4', '**'],
                    value: const ColorFilter.mode(primaryColor, BlendMode.src),
                  ),
                  ValueDelegate.colorFilter(
                    ['Shape Layer 3', '**'],
                    value: const ColorFilter.mode(eeeeee, BlendMode.src),
                  ),
                  ValueDelegate.colorFilter(
                    ['Shape Layer 2', '**'],
                    value: const ColorFilter.mode(primaryColor, BlendMode.src),
                  ),
                  ValueDelegate.colorFilter(
                    ['Shape Layer 1', '**'],
                    value: const ColorFilter.mode(mainColor, BlendMode.src),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
