import 'package:foresight/pages/home/bindings/home_bindings.dart';
import 'package:foresight/pages/splash/bindings/splash_bindings.dart';
import 'package:get/get.dart';
import 'package:foresight/pages/category_details/index.dart';
import 'package:foresight/pages/course_details/index.dart';
import 'package:foresight/pages/home/index.dart';
import 'package:foresight/pages/sign_in/index.dart';
import 'package:foresight/pages/sign_up/index.dart';
import 'package:foresight/pages/splash/index.dart';
import 'package:foresight/pages/profile/index.dart';
import 'package:foresight/pages/category_courses/index.dart';

import 'app_pages.dart';

class AppRoutes {
  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: AppPages.splash,
      page: () => const SplashView(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: AppPages.signIn,
      page: () => const SignInView(),
    ),
    GetPage(
      name: AppPages.signUp,
      page: () => const SignUpView(),
    ),
    GetPage(
      name: AppPages.profile,
      page: () => const ProfileView(),
    ),
    GetPage(
        name: AppPages.home,
        page: () => const HomeView(),
        binding: HomeBindings()),
    GetPage(
      name: AppPages.categoryDetails,
      page: () => CategoryDetailsView(),
    ),
    GetPage(
      name: AppPages.categoryCourses,
      page: () => CategoryCoursesView(),
    ),
    GetPage(
      name: AppPages.courseDetailsView,
      page: () => CourseDetailsView(),
    ),
  ];
}
