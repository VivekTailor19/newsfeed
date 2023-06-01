
import 'package:flutter/material.dart';
import 'package:news_app/model/newsInfo_model.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../model/newsModel.dart';
import '../provider/newsprovider.dart';

class TabbarData extends StatefulWidget {
  const TabbarData({Key? key}) : super(key: key);

  @override
  State<TabbarData> createState() => _TabbarDataState();
}

class _TabbarDataState extends State<TabbarData> {

  NewsProvider? newsF;
  NewsProvider? newsT;

  @override
  Widget build(BuildContext context) {

    newsT = Provider.of<NewsProvider>(context);
    newsF = Provider.of<NewsProvider>(context,listen:false);

    return FutureBuilder(
        future: newsF!.loadNews(newsT!.countrysel, newsT!.categorysel),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            {
              return Container(height: 150,alignment: Alignment.center,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sorry, for inconvience",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 14.sp,),overflow: TextOverflow.ellipsis,),
                    Text("There is no information about this category in the selected Country...",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13.sp,),overflow: TextOverflow.ellipsis,)
                  ],
                ),
              );
            }
          else if(snapshot.hasData)
            {
              NewsModel news = snapshot.data!;
              print(news.articlelist!.length);

              return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      NewsDataInDetails newsRead = NewsDataInDetails(
                        title: news.articlelist![index].title,
                        author: news.articlelist![index].author,
                        url: news.articlelist![index].url,
                        description: news.articlelist![index].description,
                        imgUrl: news.articlelist![index].imgUrl,
                        content: news.articlelist![index].content,
                        sourcename: news.articlelist![index].sourceModel!.name
                      );

                      Navigator.pushNamed(context, "read",arguments: newsRead);

                    },

                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            height: 26.w, width: 26.w, decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.w), color: Colors.yellow.shade100,
                              image: DecorationImage(image: NetworkImage(news.articlelist![index].imgUrl == null ? "https://www.openpr.com/wiki/images/56-400x300_4851":"${news.articlelist![index].imgUrl}"),fit: BoxFit.fill)
                          ),
                          ),


                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,


                              children: [
                                SizedBox(width: 60.w,
                                  child: Text(news.articlelist![index].title == null ? "" : "${news.articlelist![index].title}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11.sp),softWrap: true,
                                      maxLines: 2,overflow: TextOverflow.ellipsis),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(radius: 3.w,backgroundImage: AssetImage("assets/images/logosmall.png"),),
                                    Container(width: 60.w,child: Text(news.articlelist![index].author == null ? "" : "\t${news.articlelist![index].author}",style: TextStyle(fontWeight:FontWeight.w300,fontSize: 13.5.sp),maxLines: 1,overflow: TextOverflow.ellipsis)),

                                  ],
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                  },
                itemCount: news.articlelist!.length,
                physics: NeverScrollableScrollPhysics(),
              );



            }

          return Center(child: CircularProgressIndicator(color: Color(0xff151924)));
        },
      );

  }
}

