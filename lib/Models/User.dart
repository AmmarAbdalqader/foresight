import 'dart:convert';
import 'package:foresight/Components/FSnackBar.dart';
import 'package:foresight/Constants/AppConfig.dart';
import 'package:foresight/Helpers/API.dart';
import 'package:foresight/Helpers/HTTP.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String password;
  final String? photo;
  final DateTime signUpDate;
  final String? email;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.photo,
    required this.signUpDate,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["ID"],
        name: json["Name"],
        username: json["Username"],
        password: json["Password"],
        photo: json["Photo"],
        signUpDate: DateTime.parse(json["SignupDate"].toString()),
        email: json["Email"],
      );

  Map toMap() => {
        "ID": id,
        "Name": name,
        "Username": username,
        "Password": password,
      };

  static Future<User?> signIn(context, String username, String password) async {
    User? user;
    try {
      var res = await HTTP.post(AppConfig.url + API.signIn,
          {"username": username.trim(), "password": password});
      if (res.statusCode == 200) {
        user = User.fromJson(json.decode(res.body));
        SharedPreferences.getInstance().then((sp) async {
          await sp.setInt("UserID", user!.id);
        });
      } else if (res.statusCode == 444 && res.body.contains("Not found User")) {
        await FSnackBar(context, 'Ops', 'WrongUsernameOrPassword');
      }
    } catch (e) {
      await FSnackBar(context, 'AnErrorHasOccurred', 'CheckYourInternet');
    }
    return user;
  }

  static Future<User?> getUserByID(context, int userID) async {
    User? user;
    var res = await HTTP.get("${AppConfig.url}${API.getByID}$userID");
    if (res.statusCode == 200) {
      user = User.fromJson(json.decode(res.body));
      SharedPreferences.getInstance().then((sp) {
        sp.setInt("UserID", user!.id);
      });
    }
    return user;
  }

  static Future<bool> signUp(User user) async {
    var res = await HTTP.post(AppConfig.url + API.signUp, user.toMap());

    if (res.statusCode == 200) {
      // TODO
    }

    return true;
  }
}
