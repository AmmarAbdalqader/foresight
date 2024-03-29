import 'package:foresight/controllers/user_con.dart';
import 'package:foresight/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/input_decoration.dart';
import '../../components/loading_widget.dart';
import '../../constants/flip_locale.dart';

class SignInView extends GetView<UserCon> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    // controller controller = Get.find();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: controller.formKey,
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
                    onLongPress: () async =>
                        await controller.secretList(context),
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
                          "SignIn".tr,
                          style: GoogleFonts.tajawal(
                            color: black54,
                            fontSize: 26,
                          ),
                        ),
                        const Spacer(),
                        Obx(
                          () => TextFormField(
                            controller: controller.usernameCon.value,
                            focusNode: controller.usernameFocus.value,
                            decoration: inputDecoration(
                              "Username",
                              Icons.person,
                            ),
                            style: GoogleFonts.tajawal(
                              fontSize: 16,
                              color: black,
                            ),
                            onFieldSubmitted: (e) =>
                                controller.passwordFocus.value.requestFocus(),
                            validator: (v) {
                              if (v!.trim().isEmpty) {
                                return "InputUsername".tr;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () => TextFormField(
                                  controller: controller.passwordCon.value,
                                  obscureText: controller.obscureText.value,
                                  focusNode: controller.passwordFocus.value,
                                  decoration: inputDecoration(
                                    "Password",
                                    Icons.password,
                                  ),
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16,
                                    color: black,
                                  ),
                                  onFieldSubmitted: (e) async =>
                                      await controller.signIn(context),
                                  validator: (v) {
                                    if (v!.trim().isEmpty) {
                                      return "InputPassword".tr;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Obx(
                              () => IconButton(
                                onPressed: () => controller.flipObscureText(),
                                icon: Icon(
                                  controller.obscureText.isTrue
                                      ? CupertinoIcons.eye_slash_fill
                                      : CupertinoIcons.eye_solid,
                                  color: controller.obscureText.isTrue
                                      ? black54
                                      : primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Obx(
                          () => AnimatedSwitcher(
                            duration: const Duration(milliseconds: 100),
                            child: controller.loading.isTrue
                                ? const LoadingWidget(
                                    key: ValueKey(1),
                                  )
                                : ElevatedButton(
                                    key: const ValueKey(2),
                                    onPressed: () async =>
                                        await controller.signIn(context),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: mainColor,
                                      foregroundColor: white,
                                      textStyle: GoogleFonts.tajawal(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      minimumSize: const Size(150, 50),
                                    ),
                                    child: Text(
                                      "SignIn".tr,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 12.5,
                        ),
                        TextButton(
                          onPressed: () async {},
                          child: Text(
                            "ForgetYourPassword?".tr,
                            style: const TextStyle(
                              fontSize: 14,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "createAccount".tr,
                              style: const TextStyle(
                                fontSize: 14,
                                color: black54,
                              ),
                            ),
                            const SizedBox(width: 6),
                            TextButton(
                              onPressed: () => Get.toNamed(AppPages.signUp),
                              child: Text(
                                "RegisterNow!".tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(flex: 2),
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
    );
  }
}
