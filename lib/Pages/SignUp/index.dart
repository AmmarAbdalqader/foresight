import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foresight/Constants/FColors.dart';
import 'package:foresight/Controllers/UserCon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Components/input_decoration.dart';
import '../../Components/loading_widget.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userCon = context.watch<UserCon>();
    return WillPopScope(
      onWillPop: () {
        userCon.clear();
        return Future(() => true);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: userCon.formKeySignUp,
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
                          "SignUp".tr(),
                          style: GoogleFonts.tajawal(
                            color: mainColor,
                            fontSize: 26,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: userCon.nameCon,
                          autofocus: true,
                          decoration: inputDecoration(
                            "Name",
                            CupertinoIcons.person_crop_circle_fill,
                          ),
                          style: GoogleFonts.tajawal(
                            fontSize: 16,
                            color: black,
                          ),
                          onFieldSubmitted: (e) =>
                              userCon.userFocus.requestFocus(),
                          validator: (v) {
                            if (v!.trim().isEmpty) {
                              return "InputName".tr();
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: userCon.emailCon,
                          focusNode: userCon.emailFocus,
                          decoration: inputDecoration(
                            "Email",
                            Icons.alternate_email,
                          ),
                          style: GoogleFonts.tajawal(
                            fontSize: 16,
                            color: black,
                          ),
                          onFieldSubmitted: (e) =>
                              FocusScope.of(context).requestFocus(FocusNode()),
                          validator: (v) => userCon.validateEmail(),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: userCon.usernameSignCon,
                          focusNode: userCon.userFocus,
                          decoration: inputDecoration(
                            "Username",
                            Icons.person,
                          ),
                          style: GoogleFonts.tajawal(
                            fontSize: 16,
                            color: black,
                          ),
                          onFieldSubmitted: (e) =>
                              userCon.passFocus.requestFocus(),
                          validator: (v) {
                            if (v!.trim().isEmpty) {
                              return "InputUsername".tr();
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: userCon.passwordSignCon,
                                obscureText: userCon.obscureText,
                                focusNode: userCon.passFocus,
                                decoration: inputDecoration(
                                  "Password",
                                  Icons.password,
                                ),
                                style: GoogleFonts.tajawal(
                                  fontSize: 16,
                                  color: black,
                                ),
                                onFieldSubmitted: (e) =>
                                    userCon.emailFocus.requestFocus(),
                                validator: (v) {
                                  if (v!.trim().isEmpty) {
                                    return "InputPassword".tr();
                                  }
                                  if (v.trim().length < 6) {
                                    return "Password6len".tr();
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
                                color: userCon.obscureText
                                    ? black54
                                    : primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: userCon.isSignUpLoading
                              ? const LoadingWidget(
                                  key: ValueKey(1),
                                )
                              : ElevatedButton(
                                  key: const ValueKey(2),
                                  onPressed: () async =>
                                      await userCon.signUp(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: mainColor,
                                    textStyle: GoogleFonts.tajawal(
                                      color: white,
                                      fontSize: 22,
                                    ),
                                    minimumSize: const Size(150, 50),
                                  ),
                                  child: Text(
                                    "SignUp".tr(),
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 12.5,
                        ),
                        const Spacer(
                          flex: 2,
                        ),
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
      ),
    );
  }
}
