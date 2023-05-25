import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    newsF = Provider.of<NewsProvider>(context,listen: false);


    return SafeArea(
      child: FutureBuilder(
        future: newsF!.loadNews("ca"),
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
               ),),);
            }
            
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      )
    );
  }
}
