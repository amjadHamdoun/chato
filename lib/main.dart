import 'dart:io';

import 'package:chato/Globals.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Preference.dart';
import 'core/utils/show_notification.dart';
import 'feature/splash/splash_screen.dart';
import 'injection.dart' as di;
import 'core/utils/theme_manager.dart';



void main() async{
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Preferences.init();
  await Firebase.initializeApp();
  String? token = await FirebaseMessaging.instance.getToken();
  print(token);
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  if (Platform.isIOS) {
    _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }
  FirebaseMessaging.onMessage
      .listen((RemoteMessage message) =>
      showNotification( title: message.notification!.title!,details:  message.notification!.body!,
      url: ''
      ));

  Global.darkMode=Preferences.getDarkMode()!;
  Global.lan=Preferences.getLan()!;

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'),
          Locale('ar', 'AR')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Global.lan=='ar'?
        const Locale('ar', 'AR'):const Locale('en', 'US'),
        startLocale: Global.lan=='ar'?
        const Locale('ar', 'AR'):const Locale('en', 'US'),
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


