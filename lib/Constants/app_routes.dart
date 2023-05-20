import 'package:get/get.dart';
import 'package:foresight/Pages/CategoryDetails/index.dart';
import 'package:foresight/Pages/CourseDetails/index.dart';
import 'package:foresight/Pages/Home/index.dart';
import 'package:foresight/Pages/SignIn/index.dart';
import 'package:foresight/Pages/SignUp/index.dart';
import 'package:foresight/Pages/Splash/index.dart';
import 'package:foresight/Pages/Profile/index.dart';
import 'package:foresight/Pages/CategoryCourses/index.dart';

class AppRoutes {
  static List<GetPage<dynamic>> routes = [
    GetPage(name: '/', page: () => const SplashView()),
    GetPage(name: '/SignInView', page: () => const SignInView()),
    GetPage(name: '/SignUpView', page: () => const SignUpView()),
    GetPage(name: '/ProfileView', page: () => const ProfileView()),
    GetPage(name: '/HomeView', page: () => const HomeView()),
    GetPage(name: '/CategoryDetailsView', page: () => CategoryDetailsView()),
    GetPage(name: '/CategoryCoursesView', page: () => CategoryCoursesView()),
    GetPage(name: '/CourseDetailsView', page: () => CourseDetailsView()),
  ];
}
