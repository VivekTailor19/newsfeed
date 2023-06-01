import 'package:flutter/cupertino.dart';
import 'package:news_app/model/newsModel.dart';
import 'package:news_app/news_api/news_api.dart';
import 'package:news_app/screens/bookmark_tab/bookmark.dart';
import 'package:news_app/screens/discover_tab/discover.dart';
import 'package:news_app/screens/home_tab/homeScreen.dart';


import '../model/category_model.dart';
import '../model/country_model.dart';
import '../screens/profile_tab/profile.dart';

class NewsProvider extends ChangeNotifier
{

  Future<NewsModel> loadNews(String? cout,String? cate)
  async {
    return await News_API.news_api.get_api(cout,cate);
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
    BookMark(),
    Profile(),
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

  String  countrysel = "in";
  String  categorysel = "business";

  List<CategoryModel> categories = [
    CategoryModel(title: "Business",value:"business" ),
    CategoryModel(title: "Entertainment",value:"entertainment" ),
    CategoryModel(title: "General",value:"general" ),
    CategoryModel(title: "Health",value:"health" ),
    CategoryModel(title: "Science",value:"science" ),
    CategoryModel(title: "Sports",value:"sports" ),
    CategoryModel(title: "Technology",value:"technology" ),
  ];

  // int tabindex = 0;
  void changetab(int index)
  {
    categorysel = categories[index].value! ;

  }


}