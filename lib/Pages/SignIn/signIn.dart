import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
                    TextFormField(
                      controller: usernameCon,
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
                        hintText: "Username".tr(),
                      ),
                      style: GoogleFonts.jockeyOne(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      onFieldSubmitted: (e) {
                        if (e.trim().isNotEmpty &&
                            passwordCon.text.trim().isNotEmpty) {
                          Navigator.pushReplacementNamed(context, "HomePage");
                        }
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: passwordCon,
                      obscureText: true,
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
                        hintText: "Password".tr(),
                      ),
                      style: GoogleFonts.jockeyOne(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      onFieldSubmitted: (e) {
                        if (usernameCon.text.trim().isNotEmpty &&
                            e.trim().isNotEmpty) {
                          Navigator.pushReplacementNamed(context, "HomePage");
                        }
                      },
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
                          Navigator.pushReplacementNamed(context, "HomePage");
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
