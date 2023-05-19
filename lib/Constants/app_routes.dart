import 'package:get/get.dart';
import 'package:foresight/Pages/CategoryDetails/index.dart';
import 'package:foresight/Pages/CourseDetails/index.dart';
import 'package:foresight/Pages/Home/index.dart';
import 'package:foresight/Pages/SignIn/signIn.dart';
import 'package:foresight/Pages/SignUp/index.dart';
import 'package:foresight/Pages/Splash.dart';
import 'package:foresight/Pages/profile/index.dart';
import 'package:foresight/Pages/CategoryCourses/index.dart';

class AppRoutes {
  static List<GetPage<dynamic>> routes = [
    GetPage(name: '/', page: () => const Splash()),
    GetPage(name: '/SignIn', page: () => const SignIn()),
    GetPage(name: '/SignUp', page: () => const SignUp()),
    GetPage(name: '/HomePage', page: () => const HomePage()),
    GetPage(name: '/Profile', page: () => const Profile()),
    GetPage(name: '/CategoryCourses', page: () => CategoryCourses()),
    GetPage(name: '/CourseDetails', page: () => CourseDetails()),
    GetPage(name: '/CategoryDetails', page: () => CategoryDetails()),
  ];
}
