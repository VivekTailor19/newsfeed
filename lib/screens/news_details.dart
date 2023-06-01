import 'package:flutter/material.dart';
import 'package:news_app/model/newsInfo_model.dart';
import 'package:sizer/sizer.dart';

class NewsReader extends StatefulWidget {
  const NewsReader({Key? key}) : super(key: key);

  @override
  State<NewsReader> createState() => _NewsReaderState();
}

class _NewsReaderState extends State<NewsReader> {
  @override
  Widget build(BuildContext context) {

    NewsDataInDetails newsRead = ModalRoute.of(context)!.settings.arguments as NewsDataInDetails;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEFEFEB),
        appBar: AppBar(title: Text("${newsRead.sourcename}",style: TextStyle(color: Color(0xff151924),fontSize: 18.sp,fontWeight: FontWeight.w900),),backgroundColor: Color(0xffEFEFEB),elevation: 0,centerTitle: true,),
        
        body: Padding(
          padding:  EdgeInsets.all(15.sp),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text("${newsRead.title}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15.sp,),textAlign: TextAlign.justify,maxLines: 2,overflow: TextOverflow.ellipsis,),
              SizedBox(height: 2.w,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/images/logosmall.png",fit: BoxFit.fill,height: 15.sp,width: 15.sp,color: Color(0xff151924)),
                  SizedBox(width: 2.w,),
                  Text("${newsRead.author}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15.sp,),maxLines: 1,overflow: TextOverflow.ellipsis,),
                ],
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 3.w),
                child: Container(height: 60.w,width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(image: NetworkImage("${newsRead.imgUrl}"),fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(3.w),
                ),
            ),
              ),
              Text("${newsRead.description}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.sp,),textAlign: TextAlign.justify,maxLines: 4,overflow: TextOverflow.ellipsis,),

              Text("${newsRead.content}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 11.sp,),textAlign: TextAlign.justify,maxLines: 10,overflow: TextOverflow.ellipsis,),
              
              
            ],
            
          ),
        ),
      ),
    );
  }
}
