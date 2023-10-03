import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'generated/l10n.dart';
import 'init_app.dart';
import 'presentation/home/home_page.dart';
import 'presentation/login/login_page.dart';
import 'utils/constants/app_constants.dart';
import 'utils/constants/device_constants.dart';

Future<void> main() async {
  await initConfig();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        DeviceConstants.designDeviceWidth,
        DeviceConstants.designDeviceHeight,
      ),
      builder: (_, __) => GetMaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('en'),
      ),
    );
  }
}
