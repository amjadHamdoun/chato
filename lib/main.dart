import 'package:chato/Globals.dart';
import 'package:chato/feature/Pages/RoomPage/widget/create_room.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Preference.dart';
import 'feature/splash/splash_screen.dart';
import 'injection.dart' as di;
import 'core/utils/theme_manager.dart';


void main() async{
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Preferences.init();


  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AR')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('ar', 'AR'),
        startLocale: const Locale('ar', 'AR'),
        child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () =>
      MaterialApp(
        title: 'Chato',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme:Global.darkMode?  getApplicationDarkTheme()
            :getApplicationLightTheme(),

        home: const SplashScreen(),
      ),
    );
  }
}


