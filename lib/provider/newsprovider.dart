import 'package:flutter/cupertino.dart';
import 'package:news_app/model/newsModel.dart';
import 'package:news_app/news_api/news_api.dart';
import 'package:news_app/screens/discover.dart';
import 'package:news_app/screens/homeScreen.dart';
import 'package:news_app/screens/starting_screens/splashScreen.dart';

import '../model/category_model.dart';
import '../model/country_model.dart';

class NewsProvider extends ChangeNotifier
{

  Future<NewsModel> loadNews(String? cou)
  async {
    return await News_API.news_api.get_api(cou);
  }

  int currentindex = 0;
  void changeBottomTab(int index)
  {
    currentindex = index;
    notifyListeners();
  }

  List<Widget> screens = [
    HomeScreen(),
    DiscoverScreen(),
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
    CountryModel(name: "Ukraine",value: "ua"),
    CountryModel(name: "South Africa",value: "za"),
    CountryModel(name: "Thailand",value: "th"),
    CountryModel(name: "Singapore",value: "sg"),
    CountryModel(name: "Portugal",value: "pt"),
    CountryModel(name: "Philippines",value: "pl"),
    CountryModel(name: "New Zealand ",value: "nz"),
    CountryModel(name: "Netherlands",value: "nl"),
    CountryModel(name: "UAE",value: "ae"),
    CountryModel(name: "Australia",value: "au"),
    CountryModel(name: "Brazil",value: "br"),
    CountryModel(name: "Germany",value: "de"),
    CountryModel(name: "France",value: "fr"),
  ];

  List<CategoryModel> categories = [
    CategoryModel(title: "Business",value:"business" ),
    CategoryModel(title: "Entertainment",value:"entertainment" ),
    CategoryModel(title: "General",value:"general" ),
    CategoryModel(title: "Health",value:"health" ),
    CategoryModel(title: "Science",value:"science" ),
    CategoryModel(title: "Sports",value:"sports" ),
    CategoryModel(title: "Technology",value:"technology" ),
  ];


}