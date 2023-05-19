import 'package:foresight/Pages/CategoryDetails/index.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foresight/Pages/CourseDetails/index.dart';
import 'package:foresight/Pages/Home/index.dart';
import 'package:foresight/Pages/SignIn/signIn.dart';
import 'package:foresight/Pages/SignUp/index.dart';
import 'package:foresight/Pages/Splash.dart';
import 'package:foresight/Pages/profile/index.dart';
import 'package:get_storage/get_storage.dart';
import 'Pages/CategoryCourses/index.dart';
import 'Translation/my_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Foresight',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme:
                Typography.englishLike2018.apply(fontSizeFactor: 1.23.sp),
          ),
          translations: MyLocalization(),
          locale: const Locale('en', 'JO'),
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => const Splash()),
            GetPage(name: '/SignIn', page: () => const SignIn()),
            GetPage(name: '/SignUp', page: () => const SignUp()),
            GetPage(name: '/HomePage', page: () => const HomePage()),
            GetPage(name: '/Profile', page: () => const Profile()),
            GetPage(name: '/CategoryCourses', page: () => CategoryCourses()),
            GetPage(name: '/CourseDetails', page: () => CourseDetails()),
            GetPage(name: '/CategoryDetails', page: () => CategoryDetails()),
          ],
        );
      },
    );
  }
}
