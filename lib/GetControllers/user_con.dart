import 'package:foresight/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Components/FSnackBar.dart';
import '../Components/secret_password.dart';
import '../Constants/AppConfig.dart';

class UserCon extends GetxController {
  User? user;

  List<User> allUsers = [];

  var loading = false.obs;
  var isSignUpLoading = false.obs;
  var obscureText = true.obs;

  void setLoading() => loading.value = !loading.value;
  void flipObscureText() => obscureText.value = !obscureText.value;
  void signUpLoading() => isSignUpLoading.value = !isSignUpLoading.value;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();

  var usernameCon = TextEditingController().obs;
  var passwordCon = TextEditingController().obs;

  var usernameSignCon = TextEditingController().obs;
  var passwordSignCon = TextEditingController().obs;
  var emailCon = TextEditingController().obs;
  var nameCon = TextEditingController().obs;

  var userFocus = FocusNode().obs;
  var passFocus = FocusNode().obs;
  var emailFocus = FocusNode().obs;

  var usernameFocus = FocusNode().obs;
  var passwordFocus = FocusNode().obs;

  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future splash() async {
    final storage = GetStorage();
    int? userID = storage.read("UserID");
    if (userID != null && userID != 0) {
      await getUserByID(userID);
    } else {
      Get.offNamed('/SignIn');

      /// pushReplacementNamed
    }
  }

  Future getUserByID(int userID) async {
    user = await User.getUserByID(userID);
    if (user != null) {
      Get.offNamed('/HomePage');
    }
  }

  Future signIn(context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      setLoading();
      user = await User.signIn(
          context, usernameCon.value.text, passwordCon.value.text);
      if (user != null) {
        clear();
        Get.offNamed('/HomePage');
      }
      setLoading();
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
}
