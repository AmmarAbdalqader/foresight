import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foresight/Components/secret_password.dart';
import 'package:foresight/Constants/AppConfig.dart';
import 'package:foresight/Models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Components/FSnackBar.dart';

class UserCon extends ChangeNotifier {
  User? user;

  List<User> allUsers = [];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();

  final TextEditingController usernameCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();

  final TextEditingController usernameSignCon = TextEditingController();
  final TextEditingController passwordSignCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController nameCon = TextEditingController();

  FocusNode userFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  FocusNode emailFocus = FocusNode();

  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool isLoading = false;
  bool isSignUpLoading = false;
  bool obscureText = true;

  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  void loading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void signUpLoading() {
    isSignUpLoading = !isSignUpLoading;
    notifyListeners();
  }

  void flipObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void profile() {
    passwordCon.text = user!.password;
    nameCon.text = user!.name;
    emailCon.text = user!.email!;
    notifyListeners();
  }

  void clear() {
    usernameCon.clear();
    passwordCon.clear();
    usernameSignCon.clear();
    passwordSignCon.clear();
    emailCon.clear();
    nameCon.clear();
    isLoading = false;
    isSignUpLoading = false;
    obscureText = true;
    notifyListeners();
  }

  validateEmail() {
    if (emailCon.text.isEmpty) {
      return "InputEmail".tr();
    }
    if (!emailRegex.hasMatch(emailCon.text)) {
      return "WrongFormat".tr();
    }
    return null;
  }

  Future signIn(context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      loading();
      user = await User.signIn(context, usernameCon.text, passwordCon.text);
      if (user != null) {
        clear();
        Navigator.of(context).pushReplacementNamed("HomePage");
      }
      loading();
    } else {
      await FSnackBar(context, 'Ops', 'InputAllFields');
    }
  }

  Future getUserByID(context, int userID) async {
    user = await User.getUserByID(context, userID);
    if (user != null) {
      Navigator.of(context).pushReplacementNamed("HomePage");
    }
    notifyListeners();
  }

  Future splash(context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    int? userID = sp.getInt("UserID");
    if (userID != null && userID != 0) {
      await getUserByID(context, userID);
    } else {
      Navigator.of(context).pushReplacementNamed("SignIn");
    }
  }

  Future signUp(context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKeySignUp.currentState!.validate()) {
      signUpLoading();
      User newUser = User(
          id: 0,
          name: nameCon.text,
          username: usernameSignCon.text.trim(),
          password: passwordSignCon.text,
          photo: "",
          signUpDate: DateTime.now(),
          email: emailCon.text);

      int res = await User.signUp(context, newUser);

      if (res == 1) {
        await successFSnackBar(context, 'Great', 'NewUserHasBeenCreated');
        clear();
        Navigator.of(context).pop(context);
      } else if (res == 2) {
        signUpLoading();
        await FSnackBar(context, 'Ops', 'UsernameIsUsed');
      } else if (res == 0) {
        signUpLoading();
        await FSnackBar(context, 'Ops', 'AnErrorHasOccurred');
      }
    }
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
          await FSnackBar(context, 'Ops', 'AnErrorHasOccurred');
        }
      } else {
        await FSnackBar(context, 'Ops', 'WrongPassword');
      }
    }
  }
}
