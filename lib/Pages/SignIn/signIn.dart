import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foresight/Components/Fields.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatelessWidget {
  final TextEditingController usernameCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 45),
              child: Text(
                "Foresight",
                style: GoogleFonts.jockeyOne(
                  color: white,
                  fontSize: 45,
                  letterSpacing: 3.5,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(18),
                margin: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "SignIn".tr(),
                      style: GoogleFonts.jockeyOne(
                        color: mainColor,
                        fontSize: 35,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Spacer(),
                    loginFields(
                      Con: usernameCon,
                      hintText: "Username",
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    loginFields(
                      Con: passwordCon,
                      hintText: "Password",
                    ),
                    const SizedBox(
                      height: 12.5,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "ForgetYourPassword?".tr(),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 12.5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (usernameCon.text.trim().isNotEmpty &&
                            passwordCon.text.trim().isNotEmpty) {
                          Navigator.pushNamed(context, "HomePage");
                        }
                      },
                      child: Text(
                        "SignIn".tr(),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        textStyle: GoogleFonts.jockeyOne(
                          color: white,
                          fontSize: 25,
                          letterSpacing: 1.2,
                        ),
                        minimumSize: Size(150, 50),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "RegisterNow!".tr(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 65,
            ),
          ],
        ),
      ),
    );
  }
}
