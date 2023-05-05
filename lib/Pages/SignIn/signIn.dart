import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:foresight/Controllers/UserCon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    var userCon = context.watch<UserCon>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          color: primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Text(
                "Foresight",
                style: GoogleFonts.tajawal(
                  color: white,
                  fontSize: 35,
                  letterSpacing: 3.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(18),
                margin: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "SignIn".tr(),
                      style: GoogleFonts.tajawal(
                        color: mainColor,
                        fontSize: 26,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const Spacer(),
                    TextFormField(
                      controller: userCon.usernameCon,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.person),
                        iconColor: black54,
                        border: InputBorder.none,
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: black54),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: black54),
                        ),
                        hintText: "Username".tr(),
                      ),
                      style: GoogleFonts.tajawal(
                        fontSize: 16,
                        color: black,
                      ),
                      onFieldSubmitted: (e) async =>
                          await userCon.signIn(context),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: userCon.passwordCon,
                            obscureText: userCon.obscureText,
                            decoration: InputDecoration(
                              icon: const Icon(Icons.password),
                              iconColor: black54,
                              border: InputBorder.none,
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: black54),
                              ),
                              hintText: "Password".tr(),
                            ),
                            style: GoogleFonts.tajawal(
                              fontSize: 16,
                              color: black,
                            ),
                            onFieldSubmitted: (e) async =>
                                await userCon.signIn(context),
                          ),
                        ),
                        IconButton(
                          onPressed: () => userCon.flipObscureText(),
                          icon: Icon(userCon.obscureText
                              ? CupertinoIcons.eye_slash_fill
                              : CupertinoIcons.eye_solid),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    userCon.isLoading
                        ? const CircularProgressIndicator(
                            color: mainColor,
                          )
                        : ElevatedButton(
                            onPressed: () async =>
                                await userCon.signIn(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor,
                              textStyle: GoogleFonts.tajawal(
                                color: white,
                                fontSize: 22,
                              ),
                              minimumSize: const Size(150, 50),
                            ),
                            child: Text(
                              "SignIn".tr(),
                            ),
                          ),
                    const SizedBox(
                      height: 12.5,
                    ),
                    TextButton(
                      onPressed: () async {},
                      child: Text(
                        "ForgetYourPassword?".tr(),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "createAccount".tr(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: black54,
                          ),
                        ),
                        const SizedBox(width: 6),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "RegisterNow!".tr(),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        if ("CurrLang".tr() == "ar") {
                          await context.setLocale(const Locale('en', 'JO'));
                        } else {
                          await context.setLocale(const Locale('ar', 'JO'));
                        }
                      },
                      icon: const Icon(
                        Icons.translate,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 65,
            ),
          ],
        ),
      ),
    );
  }
}
