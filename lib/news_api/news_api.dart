import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/newsModel.dart';
class News_API
{
  static News_API news_api = News_API();

  Future<NewsModel> get_api(String? country,String? category)
  async {
    String apilink = "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=3c003fea7982479aa7350cb4b3f9b806";
    var response = await http.get(Uri.parse(apilink));
    var jsondata = jsonDecode(response.body);

    return NewsModel.fromJson(jsondata);

  }
}


//category:  business  entertainment general  health  science sports technology.
