import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foresight/Constants/app_config.dart';
import 'package:foresight/Models/User.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/FColors.dart';
import 'input_decoration.dart';

Future<String?> secretPasswordDialog(context) {
  final TextEditingController passwordCon = TextEditingController();

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: white,
        title: Center(child: Text("EnterSecretPassword".tr)),
        titleTextStyle: GoogleFonts.tajawal(
          fontSize: 21,
          color: black,
        ),
        contentPadding: const EdgeInsets.all(12),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: passwordCon,
                    obscureText: true,
                    decoration: inputDecoration(
                      "Password",
                      Icons.password,
                    ),
                    style: GoogleFonts.tajawal(
                      fontSize: 16,
                      color: black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          const Text(
            AppConfig.appID,
            style: TextStyle(
              fontSize: 8,
              color: black,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back(result: passwordCon.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: success,
            ),
            child: Text(
              'Submit'.tr,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: null);
            },
            style: TextButton.styleFrom(
              foregroundColor: black54,
            ),
            child: Text(
              'Cancel'.tr,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      );
    },
  );
}

Future secretUsersDialog(context, List<User> allUsers) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 900.h,
        width: 80.w,
        child: AlertDialog(
          backgroundColor: white,
          title: Center(child: Text("AllUsers".tr)),
          titleTextStyle: GoogleFonts.tajawal(
            fontSize: 21,
            color: black,
          ),
          contentPadding: const EdgeInsets.all(12),
          content: SizedBox(
            height: 900.h,
            width: 80.w,
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: allUsers.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      User user = allUsers[index];
                      return ListTile(
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            color: black,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText(
                              "${"Username".tr} : ${user.username}",
                              style: const TextStyle(
                                color: black54,
                                fontSize: 13,
                              ),
                            ),
                            SelectableText(
                              "${"Password".tr} : ${user.password}",
                              style: const TextStyle(
                                color: black54,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
