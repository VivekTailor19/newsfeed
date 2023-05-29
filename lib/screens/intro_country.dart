
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../provider/newsprovider.dart';

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
        body:GridView.builder(
          padding: EdgeInsets.all(5.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.all(5.w),
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "first",arguments: "${newsT!.countries[index].value}");
                },
                child: CountryTile(title: newsT!.countries[index].name,value: newsT!.countries[index].value)),
          );
        },
          itemCount: newsF!.countries.length,
        )
        ),

    );
  }

  Widget CountryTile({String? title, String? value})
  {
    return Container(
      height: 2.h,
      width: 15.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.w),color: Color(0xff151924)),
      child: Text("$title",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w700,color: Colors.white),),
    );
  }

}
