import 'dart:convert';
import 'package:foresight/Constants/AppConfig.dart';
import 'package:foresight/Helpers/API.dart';
import 'package:foresight/Helpers/HTTP.dart';

class User {
  final int ID;
  final String Name;
  final String Username;
  final String Password;

  User(
      {required this.ID,
      required this.Name,
      required this.Username,
      required this.Password});

  factory User.fromJson(Map<String, dynamic> json) => User(
        ID: json["ID"],
        Name: json["Name"],
        Username: json["Username"],
        Password: json["Password"],
      );

  Map toMap() => {
        "ID": ID,
        "Name": Name,
        "Username": Username,
        "Password": Password,
      };

  static Future<User?> signIn(String username, String password) async {
    User? user = null;

    var res = await HTTP
        .get(AppConfig.URL + API.signIn + "/$username" + "/$password");

    if (res.statusCode == 200) {
      user = json.decode(utf8.decode(res.bodyBytes));
    }

    return user;
  }

  static Future<bool> signUp(User user) async {
    var res = await HTTP.post(AppConfig.URL + API.signUp, user.toMap());

    if (res.statusCode == 200) {
      // TODO
    }

    return true;
  }
}
