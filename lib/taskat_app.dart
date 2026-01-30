import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskat/features/login/login_screen.dart';
import 'package:taskat/features/splash/splash_screen.dart';

class TaskatApp extends StatelessWidget {
  const TaskatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
