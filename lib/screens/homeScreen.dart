import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../model/newsModel.dart';
import '../provider/newsprovider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsProvider? newsT;
  NewsProvider? newsF;

  @override
  Widget build(BuildContext context) {
    newsT = Provider.of<NewsProvider>(context);
    newsF = Provider.of<NewsProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [

            Container(height: 50.h,width: double.infinity, color: Color(0xff151924),),

            Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/logosmall.png",fit: BoxFit.fill,height: 25.sp,width: 25.sp,),
                      SizedBox(width: 2.w,),
                      Row(mainAxisSize: MainAxisSize.min,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text("News",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                          Text("Feed",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,color: Color(0xffFFFFFF))),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.notifications_active_outlined,color: Colors.white,)
                    ],
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

/*

SafeArea(
      child: FutureBuilder(
        future: newsF!.loadNews("in"),
        builder: (context, snapshot) {

          if(snapshot.hasError)
              {
                return Scaffold(body: Center(child: Text("${snapshot.error}"),),);
              }
            else if(snapshot.hasData)
              {
                NewsModel news = snapshot.data!;
               return Scaffold(
                 body: Center(child:
                   Column(
                     children: [
                       Text("Status : ${news.status}"),
                     Text("Total Result : ${news.totalResults}"),
                     Text("Total Articles : ${news.articlelist!.length}"),
                     Expanded(
                       child: ListView.builder(itemBuilder: (context, index) {
                         return ListTile(title: Text("${news.articlelist![index].title}"));
                       },
                           itemCount:news.articlelist!.length ,),
                     )
                   ],
                 ),
                 ),
               );
            }

          return Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      )
    );

*/
