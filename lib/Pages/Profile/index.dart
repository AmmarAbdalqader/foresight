import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:foresight/Components/loading_widget.dart';
import 'package:foresight/GetControllers/user_con.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foresight/Components/app_app_bar.dart';
import 'package:foresight/Constants/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserCon userCon = Get.find();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kBottomNavigationBarHeight),
        child: FAppBar(showUserPhoto: false, elevation: 0),
      ),
      backgroundColor: white,
      body: userCon.editProfile.isTrue
          ? const LoadingWidget()
          : SingleChildScrollView(
              child: Flex(
                direction: Axis.vertical,
                children: [
                  SizedBox(
                    height: 150,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ClipPath(
                            clipper: OvalBottomBorderClipper(),
                            child: Container(
                              height: 100,
                              color: mainColor,
                            ),
                          ),
                        ),
                        const Positioned(
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: CircleAvatar(
                            backgroundColor: mainColor,
                            radius: 50,
                            child: Center(
                              child: Icon(
                                CupertinoIcons.person_crop_circle,
                                color: white,
                                size: 100,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    userCon.user!.name,
                    style: GoogleFonts.tajawal(
                      color: primaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ExpansionTile(
                    onExpansionChanged: (v) {
                      userCon.clear();
                    },
                    title: Text(
                      "ChangePassword".tr,
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                      ),
                    ),
                    childrenPadding:
                        const EdgeInsets.symmetric(horizontal: primaryPadding),
                    children: [
                      Form(
                        key: userCon.formKeyProfile,
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            TextFormField(
                              controller: userCon.newPasswordCon.value,
                              decoration: InputDecoration(
                                icon: const Icon(Icons.password),
                                iconColor: black54,
                                border: InputBorder.none,
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: black54),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: black54),
                                ),
                                hintText: "NewPassword".tr,
                              ),
                              style: GoogleFonts.tajawal(
                                fontSize: 16,
                                color: black,
                              ),
                              validator: (v) {
                                if (v!.trim().isEmpty) {
                                  return "InputPassword".tr;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: primaryPadding),
                            TextFormField(
                              controller: userCon.newPasswordTwoCon.value,
                              decoration: InputDecoration(
                                icon: const Icon(Icons.password),
                                iconColor: black54,
                                border: InputBorder.none,
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: black54),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: black54),
                                ),
                                hintText: "NewPassword2".tr,
                              ),
                              style: GoogleFonts.tajawal(
                                fontSize: 16,
                                color: black,
                              ),
                              validator: (v) {
                                if (v!.trim().isEmpty) {
                                  return "InputPassword".tr;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: primaryPadding),
                            Center(
                              child: ElevatedButton(
                                onPressed: () async =>
                                    await userCon.changePassword(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: mainColor,
                                  textStyle: const TextStyle(
                                    fontSize: mainPadding,
                                  ),
                                ),
                                child: Text("Save".tr),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
