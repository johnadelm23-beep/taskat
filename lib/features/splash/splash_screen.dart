import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:taskat/core/app_constants.dart';
import 'package:taskat/features/home/home_screen.dart';
import 'package:taskat/features/login/login_screen.dart';
import 'package:taskat/features/login/models/user_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var userData = Hive.box<UserModel>(AppConstants.userBox);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    {
      Future.delayed(Duration(seconds: 3), () {
        if (userData.isEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        } else
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Lottie.asset('assets/splash/Task Done (1).json'),
            Text(
              'It is time to be organized',
              style: TextStyle(
                fontFamily: 'appFont',
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
