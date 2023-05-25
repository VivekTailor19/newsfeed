import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, "intro");
    },);

    return SafeArea(
      child: Scaffold(
        body: Container(height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/splash.png"),fit: BoxFit.fill),),),
      ),
    );
  }
}
