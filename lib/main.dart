import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:foresight/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'constants/app_colors.dart';
import 'helpers/local_notification.dart';
import 'translation/my_localization.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) async {
      if (message.notification != null) {
        await LocalNotification().showNotification(
            id: 0,
            title: message.notification!.title,
            body: message.notification!.body);
      }
    },
  );

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
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Foresight',
          theme: ThemeData(
            useMaterial3: true,
            textTheme:
                Typography.englishLike2018.apply(fontSizeFactor: 1.23.sp),
            appBarTheme: const AppBarTheme(
              color: mainColor,
              centerTitle: true,
              scrolledUnderElevation: 1,
              iconTheme: IconThemeData(
                color: niceGrey,
              ),
            ),
            colorScheme: const ColorScheme.light(
              onError: danger,
              error: danger,
              onErrorContainer: danger,
            ),
            progressIndicatorTheme: const ProgressIndicatorThemeData(
              color: mainOldColor,
            ),
            dialogBackgroundColor: Colors.grey[50],
          ),
          translations: MyLocalization(),
          locale: Locale(GetStorage().read("Locale") ?? 'en', 'JO'),
          fallbackLocale: const Locale('en', 'JO'),
          getPages: AppRoutes.routes,
          initialRoute: AppRoutes.routes.first.name,
        );
      },
    );
  }
}
