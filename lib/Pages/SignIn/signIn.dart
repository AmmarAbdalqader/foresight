import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:foresight/Controllers/UserCon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Components/input_decoration.dart';
import '../../Components/loading_widget.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    var userCon = context.watch<UserCon>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: userCon.formKey,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [mainColor, primaryColor],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: GestureDetector(
                  onLongPress: () async => await userCon.secretList(context),
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
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  margin: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 4),
                        spreadRadius: 5,
                      ),
                    ],
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
                        focusNode: userCon.usernameFocus,
                        decoration: inputDecoration(
                          "Username",
                          Icons.person,
                        ),
                        style: GoogleFonts.tajawal(
                          fontSize: 16,
                          color: black,
                        ),
                        onFieldSubmitted: (e) =>
                            userCon.passwordFocus.requestFocus(),
                        validator: (v) {
                          if (v!.trim().isEmpty) {
                            return "InputUsername".tr();
                          }
                          return null;
                        },
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
                              focusNode: userCon.passwordFocus,
                              decoration: inputDecoration(
                                "Password",
                                Icons.password,
                              ),
                              style: GoogleFonts.tajawal(
                                fontSize: 16,
                                color: black,
                              ),
                              onFieldSubmitted: (e) async =>
                                  await userCon.signIn(context),
                              validator: (v) {
                                if (v!.trim().isEmpty) {
                                  return "InputPassword".tr();
                                }
                                return null;
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () => userCon.flipObscureText(),
                            icon: Icon(
                              userCon.obscureText
                                  ? CupertinoIcons.eye_slash_fill
                                  : CupertinoIcons.eye_solid,
                              color:
                                  userCon.obscureText ? black54 : primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: userCon.isLoading
                            ? const LoadingWidget(
                                key: ValueKey(1),
                              )
                            : ElevatedButton(
                                key: const ValueKey(2),
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
                            onPressed: () =>
                                Navigator.pushNamed(context, "SignUp"),
                            child: Text(
                              "RegisterNow!".tr(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(flex: 2),
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
      ),
    );
  }
}
