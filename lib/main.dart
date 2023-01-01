import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foresight/Pages/CourseDetails/index.dart';
import 'package:foresight/Pages/Home/index.dart';
import 'package:foresight/Pages/SignIn/signIn.dart';
import 'package:foresight/Pages/Splash.dart';
import 'Pages/CategoryCourses/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar', 'JO'), Locale('en', 'JO')],
      path: 'assets/translation',
      fallbackLocale: Locale('en', 'JO'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Foresight',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme:
                Typography.englishLike2018.apply(fontSizeFactor: 1.23.sp),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => Splash(),
            'SignIn': (context) => SignIn(),
            'HomePage': (context) => HomePage(),
            'CategoryCourses': (context) => CategoryCourses(
                lesson: ModalRoute.of(context)!.settings.arguments.toString()),
            'CourseDetails': (context) => CourseDetails(
                lesson: ModalRoute.of(context)!.settings.arguments.toString()),
          },
        );
      },
    );
  }
}
