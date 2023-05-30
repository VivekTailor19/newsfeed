
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../provider/newsprovider.dart';

class Intro_Country extends StatefulWidget {
  const Intro_Country({Key? key}) : super(key: key);

  @override
  State<Intro_Country> createState() => _Intro_CountryState();
}

class _Intro_CountryState extends State<Intro_Country> {
  NewsProvider? newsT;
  NewsProvider? newsF;
  @override
  Widget build(BuildContext context) {

    newsT = Provider.of<NewsProvider>(context);
    newsF = Provider.of<NewsProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEFEFEB),
        body:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12.h,

                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Choose Interests News",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),),
                        Text("Get better News recommendations",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w300),),
                      ],
                    ),
                  )
              ),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(5.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
              mainAxisSpacing: 1.w,crossAxisSpacing: 1.w),
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "first",arguments: "${newsT!.countries[index].value}");
                    },
                    child: Container(
                      height: 8.w,
                      width: 15.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),color: Colors.white),
                      child: Text("${newsT!.countries[index].name}",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600,color: Color(0xff151924)),textAlign: TextAlign.center,
                          softWrap: true),
                    )

                   // CountryTile(title: newsT!.countries[index].name,value: newsT!.countries[index].value),
                );
              },
                itemCount: newsF!.countries.length,
              ),
            ],
          ),
        )
        ),

    );
  }

  Widget CountryTile({String? title, String? value})
  {
    return Container(
      height: 1.h,
      width: 15.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),color: Colors.white),
      child: Text("$title",style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.w300,color: Color(0xff151924)),textAlign: TextAlign.center,
      softWrap: true),
    );
  }

}

//color: Color(0xff151924)