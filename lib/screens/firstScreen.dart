import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../provider/newsprovider.dart';

class First_Screen extends StatefulWidget {
  const First_Screen({Key? key}) : super(key: key);

  @override
  State<First_Screen> createState() => _First_ScreenState();
}

class _First_ScreenState extends State<First_Screen> {
  NewsProvider? newsT;
  NewsProvider? newsF;

  @override
  Widget build(BuildContext context) {

    newsT = Provider.of<NewsProvider>(context);
    newsF = Provider.of<NewsProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(

        body: newsT!.screens[newsT!.currentindex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: IconThemeData(color: Color(0xff151924),size: 15.sp),
            unselectedIconTheme: IconThemeData(color: Colors.black12,size: 15.sp),

            currentIndex: newsT!.currentindex,


            onTap: (value) {
              return newsF!.changeBottomTab(value);
            },

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.explore_rounded),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.bookmark_rounded),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded),label: ""),
            ],
        ),

      ),
    );
  }
}
