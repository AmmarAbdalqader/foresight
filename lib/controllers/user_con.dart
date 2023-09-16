import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:foresight/models/user.dart';
import 'package:flutter/material.dart';
import 'package:foresight/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:foresight/components/app_snack_bars.dart';
import 'package:foresight/components/secret_password.dart';
import 'package:foresight/constants/app_config.dart';

class UserCon extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyProfile = GlobalKey<FormState>();

  User? user;

  List<User> allUsers = [];

  RxBool loading = false.obs;
  RxBool isSignUpLoading = false.obs;
  RxBool obscureText = true.obs;
  RxBool editProfile = false.obs;

  Rx<TextEditingController> oldPasswordCon = TextEditingController().obs;
  Rx<TextEditingController> newPasswordCon = TextEditingController().obs;
  Rx<TextEditingController> newPasswordTwoCon = TextEditingController().obs;

  Rx<TextEditingController> usernameCon = TextEditingController().obs;
  Rx<TextEditingController> passwordCon = TextEditingController().obs;

  Rx<TextEditingController> usernameSignCon = TextEditingController().obs;
  Rx<TextEditingController> passwordSignCon = TextEditingController().obs;
  Rx<TextEditingController> emailCon = TextEditingController().obs;
  Rx<TextEditingController> nameCon = TextEditingController().obs;

  Rx<FocusNode> userFocus = FocusNode().obs;
  Rx<FocusNode> passFocus = FocusNode().obs;
  Rx<FocusNode> emailFocus = FocusNode().obs;

  Rx<FocusNode> usernameFocus = FocusNode().obs;
  Rx<FocusNode> passwordFocus = FocusNode().obs;

  static RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  String? token = "";

  void flipLoading() => loading.value = !loading.value;
  void flipObscureText() => obscureText.value = !obscureText.value;
  void signUpLoading() => isSignUpLoading.value = !isSignUpLoading.value;
  void editProfileLoading() => editProfile.value = !editProfile.value;

  Future splash() async {
    if (!kIsWeb) {
      FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
      token = await firebaseMessaging.getToken();
    }
    final storage = GetStorage();
    int? userID = storage.read("UserID");
    if (userID != null && userID != 0) {
      await getUserByID(userID);
    } else {
      Get.offNamed(AppPages.signIn);
    }
  }

  Future getUserByID(int userID) async {
    user = await User.getUserByID(userID);
    if (user != null) {
      Get.offNamed(AppPages.home);
    }
  }

  Future signIn(context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      flipLoading();
      user = await User.signIn(context, {
        "username": usernameCon.value.text.trim(),
        "password": passwordCon.value.text,
        "token": token ?? ""
      });
      flipLoading();
      if (user != null) {
        clear();
        Get.offNamed(AppPages.home);
      }
    } else {
      await errorFSnackBar(context, 'Ops', 'InputAllFields');
    }
  }

  void clear() {
    usernameCon.value.clear();
    passwordCon.value.clear();
    usernameSignCon.value.clear();
    passwordSignCon.value.clear();
    emailCon.value.clear();
    nameCon.value.clear();
    loading.value = false;
    isSignUpLoading.value = false;
    obscureText.value = true;
    update();
  }

  Future signUp(context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKeySignUp.currentState!.validate()) {
      signUpLoading();
      User newUser = User(
          id: 0,
          name: nameCon.value.text,
          username: usernameSignCon.value.text.trim(),
          password: passwordSignCon.value.text,
          photo: "",
          signUpDate: DateTime.now(),
          email: emailCon.value.text);

      int res = await User.signUp(context, newUser);

      if (res == 1) {
        await successFSnackBar(context, 'Great', 'NewUserHasBeenCreated');
        clear();
        Get.back();
      } else if (res == 2) {
        signUpLoading();
        await errorFSnackBar(context, 'Ops', 'UsernameIsUsed');
      } else if (res == 0) {
        signUpLoading();
        await errorFSnackBar(context, 'Ops', 'AnErrorHasOccurred');
      }
    }
  }

  validateEmail() {
    if (emailCon.value.text.isEmpty) {
      return "InputEmail".tr;
    }
    if (!emailRegex.hasMatch(emailCon.value.text)) {
      return "WrongFormat".tr;
    }
    return null;
  }

  Future secretList(context) async {
    DateTime now = DateTime.now();

    String? secretPassword = await secretPasswordDialog(context);

    if (secretPassword != null && secretPassword.isNotEmpty) {
      if (secretPassword == "${now.day}${AppConfig.appID}${now.year}") {
        try {
          allUsers = await User.getAllUsers(context);
          await secretUsersDialog(context, allUsers);
        } catch (e) {
          await errorFSnackBar(context, 'Ops', 'AnErrorHasOccurred');
        }
      } else {
        await errorFSnackBar(context, 'Ops', 'WrongPassword');
      }
    }
  }

  void clearPasswords() {
    oldPasswordCon.value.clear();
    newPasswordCon.value.clear();
    newPasswordTwoCon.value.clear();
    update();
  }

  Future changePassword(context) async {
    if (formKeyProfile.currentState!.validate()) {
      if (newPasswordCon.value.text == newPasswordTwoCon.value.text) {
        editProfileLoading();
        (bool?, String?) res = await User.changePassword(context, user!.id,
            oldPasswordCon.value.text, newPasswordCon.value.text);
        editProfileLoading();
        if (res.$1 != null && res.$2 != null) {
          if (res.$1! && res.$2!.contains("OK")) {
            foresightSnackBar(context, 'Done', 'Success', ContentType.success);
            clearPasswords();
          } else if (res.$1! && res.$2!.contains("WrongPassword")) {
            foresightSnackBar(
                context, 'Ops', 'WrongPassword', ContentType.warning);
            oldPasswordCon.value.clear();
          } else {
            foresightSnackBar(context, 'Ops', 'Error', ContentType.failure);
          }
        } else {
          clearPasswords();
        }
      } else {
        foresightSnackBar(
            context, 'Ops', 'PasswordsMustBeIdentical', ContentType.failure);
        newPasswordTwoCon.value.clear();
      }
    }
  }

  Future signOut() async {
    final storage = GetStorage();
    await storage.write("UserID", 0);
    user = null;
    clear();
    Get.offAllNamed(AppPages.splash);
  }
}
