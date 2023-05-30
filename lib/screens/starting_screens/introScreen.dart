import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Intro_Screen extends StatefulWidget {
  const Intro_Screen({Key? key}) : super(key: key);

  @override
  State<Intro_Screen> createState() => _Intro_ScreenState();
}

class _Intro_ScreenState extends State<Intro_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEFEFEB),


        body: Padding(
          padding:  EdgeInsets.only(top: 35.sp,bottom: 15.sp,left: 25.sp,right:  25.sp),
          child: Column(
            children: [

              Container(height: 45.h,width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: AssetImage("assets/images/Frame88.png"),fit: BoxFit.fill),
              ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.sp),
                child: Text("Discover Breaking News! 🔥",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,color: Color(0xff151924)),),
              ),
              Text("Make it easy for users to access the latest and ost recent news quickly and easily from a single platform.",
                style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w300,color: Color(0xff616161)),textAlign: TextAlign.center,),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.sp),
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, "intro2"),
                  child: Container(height: 6.h,width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.h),
                      color: Color(0xff151924),

                  ),
                  alignment: Alignment.center,
                  child: Text("Continue",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w600,color: Colors.white)),),
                ),
              )

            ],
          ),
        ),

      ),

    );
  }
}
