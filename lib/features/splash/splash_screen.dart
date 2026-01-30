import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskat/features/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();{
      Future.delayed(Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
          Text('It is time to be organized',style: TextStyle(fontFamily: 'appFont',
          fontSize: 20,
          color: Colors.grey),)
        ],
        ),
      ),
    );
  }
}
