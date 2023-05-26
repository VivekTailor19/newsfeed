import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/provider/newsprovider.dart';
import 'package:news_app/screens/firstScreen.dart';
import 'package:news_app/screens/homeScreen.dart';
import 'package:news_app/screens/introScreen.dart';
import 'package:news_app/screens/splashScreen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create:  (context) => NewsProvider(),),
        ],
        child: MaterialApp(
          theme: ThemeData(fontFamily: "Popping"),
          debugShowCheckedModeBanner: false,
          routes: {
            "/": (context) => SplashScreen(),
            "intro":(context) => Intro_Screen(),
            "first":(context) => First_Screen(),
            "home": (context) => HomeScreen(),
          },
        ),
      ),
    ),
  );
}
