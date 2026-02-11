import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskat/features/add_task/add_task_screen.dart';
import 'package:taskat/features/home/home_screen.dart';
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
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
