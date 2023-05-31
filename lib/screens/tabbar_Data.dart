import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TabbarData extends StatefulWidget {
  const TabbarData({Key? key}) : super(key: key);

  @override
  State<TabbarData> createState() => _TabbarDataState();
}

class _TabbarDataState extends State<TabbarData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 30.w, width: 100.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),),
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              height: 26.w, width: 26.w, decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.w), color: Colors.yellow.shade100,
                image: DecorationImage(image: NetworkImage("imgurl"),fit: BoxFit.fill)
            ),),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,


                children: [

                  Container(width: 60.w,
                    child: Text("title",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11.sp),softWrap: true,
                        maxLines: 2,overflow: TextOverflow.ellipsis),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(radius: 3.w,backgroundImage: AssetImage("assets/images/logosmall.png"),),
                      Text("\tauthor",style: TextStyle(fontWeight:FontWeight.w300,fontSize: 13.5.sp),maxLines: 1,overflow: TextOverflow.ellipsis),

                    ],
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
