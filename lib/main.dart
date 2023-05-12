import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foresight/Controllers/UserCon.dart';
import 'package:foresight/Pages/CourseDetails/index.dart';
import 'package:foresight/Pages/Home/index.dart';
import 'package:foresight/Pages/SignIn/signIn.dart';
import 'package:foresight/Pages/SignUp/index.dart';
import 'package:foresight/Pages/Splash.dart';
import 'package:foresight/Pages/profile/index.dart';
import 'package:provider/provider.dart';
import 'Pages/CategoryCourses/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar', 'JO'), Locale('en', 'JO')],
      path: 'assets/translation',
      fallbackLocale: const Locale('en', 'JO'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserCon()),
      ],
      child: ScreenUtilInit(
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
              '/': (context) => const Splash(),
              'SignIn': (context) => const SignIn(),
              'SignUp': (context) => const SignUp(),
              'HomePage': (context) => const HomePage(),
              'profile': (context) => const Profile(),
              'CategoryCourses': (context) => CategoryCourses(
                  lesson:
                      ModalRoute.of(context)!.settings.arguments.toString()),
              'CourseDetails': (context) => CourseDetails(
                  lesson:
                      ModalRoute.of(context)!.settings.arguments.toString()),
            },
          );
        },
      ),
    );
  }
}
