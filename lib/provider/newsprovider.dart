import 'package:flutter/cupertino.dart';
import 'package:news_app/model/newsModel.dart';
import 'package:news_app/news_api/news_api.dart';

class NewsProvider extends ChangeNotifier
{

  Future<NewsModel> loadNews(String? cou)
  async {
    return await News_API.news_api.get_api(cou);

    notifyListeners();
  }


}