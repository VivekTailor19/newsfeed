import 'package:flutter/cupertino.dart';
import 'package:news_app/model/newsModel.dart';
import 'package:news_app/news_api/news_api.dart';
import 'package:news_app/screens/homeScreen.dart';
import 'package:news_app/screens/splashScreen.dart';

import '../model/country_model.dart';

class NewsProvider extends ChangeNotifier
{

  Future<NewsModel> loadNews(String? cou)
  async {
    return await News_API.news_api.get_api(cou);
    notifyListeners();
  }

  int currentindex = 0;
  void changeBottomTab(int index)
  {
    currentindex = index;
    notifyListeners();
  }

  List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),

    HomeScreen(),
    HomeScreen(),
  ];

  List<CountryModel> countries = [
    CountryModel(name: "India",value: "in"),
    CountryModel(name: "USA",value: "us"),
    CountryModel(name: "Israil",value: "il"),
    CountryModel(name: "Canada",value: "ca"),
    CountryModel(name: "Russia",value: "ru"),
    CountryModel(name: "Japan",value: "jp"),
  ];


}