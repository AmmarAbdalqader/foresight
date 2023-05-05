import 'package:flutter/material.dart';
import 'package:foresight/Models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCon extends ChangeNotifier {
  User? user;
  final TextEditingController usernameCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  bool isLoading = false;
  bool obscureText = true;

  void loading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void flipObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  Future signIn(context) async {
    if (usernameCon.text.trim().isNotEmpty &&
        passwordCon.text.trim().isNotEmpty) {
      loading();
      user = await User.signIn(context, usernameCon.text, passwordCon.text);
      if (user != null) {
        Navigator.of(context).pushReplacementNamed("HomePage");
      }
      loading();
    } else {
      // snackBar
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
    SharedPreferences.getInstance().then((sp) async {
      int? userID = sp.getInt("UserID");
      if (userID != null && userID != 0) {
        await getUserByID(context, userID);
      } else {
        Navigator.of(context).pushReplacementNamed("SignIn");
      }
    });
  }
}