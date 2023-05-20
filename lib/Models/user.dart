import 'dart:convert';
import 'package:foresight/Components/app_snack_bars.dart';
import 'package:foresight/Constants/app_config.dart';
import 'package:foresight/Helpers/API.dart';
import 'package:foresight/Helpers/HTTP.dart';
import 'package:get_storage/get_storage.dart';

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
        "Photo": photo,
        "Email": email,
      };

  static Future<User?> signIn(context, Map map) async {
    User? user;
    try {
      var res = await HTTP.patch(AppConfig.url + API.signIn, map);
      if (res.statusCode == 200) {
        user = User.fromJson(json.decode(res.body));

        final storage = GetStorage();
        await storage.write("UserID", user.id);
      } else if (res.statusCode == 444 && res.body.contains("Not found User")) {
        await errorFSnackBar(context, 'Ops', 'WrongUsernameOrPassword');
      } else {
        await errorFSnackBar(context, 'AnErrorHasOccurred',
            "${res.statusCode} - ${res.reasonPhrase!}");
      }
    } catch (e) {
      await errorFSnackBar(
          context, 'AnErrorHasOccurred', 'CheckYourInternet \n $e');
    }
    return user;
  }

  static Future<User?> getUserByID(int userID) async {
    User? user;
    var res = await HTTP.get("${AppConfig.url}${API.getByID}$userID");
    if (res.statusCode == 200) {
      user = User.fromJson(json.decode(res.body));
      final storage = GetStorage();
      await storage.write("UserID", user.id);
    }
    return user;
  }

  static Future<int> signUp(context, User user) async {
    try {
      var res = await HTTP.patch(AppConfig.url + API.signUp, user.toMap());

      if (res.statusCode == 200 && res.reasonPhrase!.contains("OK")) {
        return 1;
      } else if (res.statusCode == 555 &&
          res.reasonPhrase!.contains("unknown")) {
        return 2;
      } else {
        return 0;
      }
    } catch (e) {
      await errorFSnackBar(
          context, 'AnErrorHasOccurred', 'CheckYourInternet \n $e');
      return -1;
    }
  }

  static Future<List<User>> getAllUsers(context) async {
    List<User> list = [];
    var res = await HTTP.get("${AppConfig.url}${API.getAllUsers}");
    if (res.statusCode == 200) {
      list = (json.decode(utf8.decode(res.bodyBytes)) as List)
          .map((e) => User.fromJson(e))
          .toList();
    }
    return list;
  }
}
