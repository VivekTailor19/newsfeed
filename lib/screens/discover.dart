import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEFEFEB),

        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.sp),
              child: Container(height: 11.w,width: double.infinity,
                child: Row(

                  children: [
                    Expanded(
                      child: TextField(

                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 8.sp),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search_rounded,color: Color(0xff151924),),
                          hintText: "Find Breaking News",
                          hintStyle: TextStyle(color: Color(0xff151924),fontWeight: FontWeight.w400),

                          enabled: true,
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w),borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w),borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(width: 1.w,),
                    Container(height: 11.w,width: 11.w,
                      alignment: Alignment.center,
                      child: Icon(Icons.sort_rounded,color: Color(0xff151924),size: 25.sp,),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.w),color: Colors.white),)
                  ],
                ),
              ),
            ),

            DefaultTabController(
              length: 7,
              initialIndex: 0,

              child: Column(
                children: [
                             //business
                            // entertainment
                            // general
                            // health
                            // science
                            // sports
                            // technology
                  Container(
                    child: TabBar(tabs: [
                      Tab(text: "Business",),
                      Tab(text: "Entertainment"),
                      Tab(text: "General"),
                      Tab(text: "Health"),
                      Tab(text: "Science"),
                      Tab(text: "Sports"),
                      Tab(text: "Technology"),

                    ],isScrollable: true,
                      indicatorColor: Color(0xff151924),

                      labelColor: Color(0xff151924),
                    ),
                  ),
                  SizedBox(height: 50,),

                  Container(
                    height: 150,width: 250,
                    child: TabBarView(
                      children: [
                        Icon(Icons.directions_car),
                        Icon(Icons.directions_transit),
                        Icon(Icons.directions_bike),
                        Icon(Icons.directions_car),
                        Icon(Icons.directions_transit),
                        Icon(Icons.directions_bike),
                        Icon(Icons.search)

                      ],
                    ),
                  ),
                ],
              ),

            ),



          ],
        ),

      ),
    );
  }


}
