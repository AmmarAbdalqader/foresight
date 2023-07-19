import 'package:foresight/controllers/user_con.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/input_decoration.dart';
import '../../components/loading_widget.dart';
import '../../constants/flip_locale.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserCon userCon = Get.find();
    return WillPopScope(
      onWillPop: () {
        userCon.clear();
        return Future(() => true);
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
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
                            "SignUp".tr,
                            style: GoogleFonts.tajawal(
                              color: mainColor,
                              fontSize: 26,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Obx(
                            () => TextFormField(
                              controller: userCon.nameCon.value,
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
                                  userCon.emailFocus.value.requestFocus(),
                              validator: (v) {
                                if (v!.trim().isEmpty) {
                                  return "InputName".tr;
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: userCon.emailCon.value,
                            focusNode: userCon.emailFocus.value,
                            decoration: inputDecoration(
                              "Email",
                              Icons.alternate_email,
                            ),
                            style: GoogleFonts.tajawal(
                              fontSize: 16,
                              color: black,
                            ),
                            onFieldSubmitted: (e) =>
                                userCon.userFocus.value.requestFocus(),
                            validator: (v) => userCon.validateEmail(),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Obx(
                            () => TextFormField(
                              controller: userCon.usernameSignCon.value,
                              focusNode: userCon.userFocus.value,
                              decoration: inputDecoration(
                                "Username",
                                Icons.person,
                              ),
                              style: GoogleFonts.tajawal(
                                fontSize: 16,
                                color: black,
                              ),
                              onFieldSubmitted: (e) =>
                                  userCon.passFocus.value.requestFocus(),
                              validator: (v) {
                                if (v!.trim().isEmpty) {
                                  return "InputUsername".tr;
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Obx(
                            () => Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: userCon.passwordSignCon.value,
                                    obscureText: userCon.obscureText.value,
                                    focusNode: userCon.passFocus.value,
                                    decoration: inputDecoration(
                                      "Password",
                                      Icons.password,
                                    ),
                                    style: GoogleFonts.tajawal(
                                      fontSize: 16,
                                      color: black,
                                    ),
                                    onFieldSubmitted: (e) =>
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode()),
                                    validator: (v) {
                                      if (v!.trim().isEmpty) {
                                        return "InputPassword".tr;
                                      }
                                      if (v.trim().length < 6) {
                                        return "Password6len".tr;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => userCon.flipObscureText(),
                                  icon: Icon(
                                    userCon.obscureText.isTrue
                                        ? CupertinoIcons.eye_slash_fill
                                        : CupertinoIcons.eye_solid,
                                    color: userCon.obscureText.isTrue
                                        ? black54
                                        : primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Obx(
                            () => AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: userCon.isSignUpLoading.isTrue
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
                                        "SignUp".tr,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 12.5,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              "SignIn".tr,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () => FlipLocale.flipLocale(),
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
      ),
    );
  }
}
