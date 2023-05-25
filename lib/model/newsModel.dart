class NewsModel
{
  String? status;
  int? totalResults;
  List<ArticleModel>? articlelist = [];

  NewsModel({this.status, this.totalResults, this.articlelist});

  factory NewsModel.fromJson(Map news)
  {
    List articles = news['articles'];

    return NewsModel(status:news['status'],totalResults:news['totalResults'],
        articlelist:articles.map((e) => ArticleModel.fromJson(e)).toList()
    );
  }
}

class ArticleModel
{
  String? author,title,description,url,imgUrl,publish,content;
  SourceModel? sourceModel;

  ArticleModel({this.author,this.title, this.description, this.url, this.imgUrl, this.publish, this.content, this.sourceModel});

  factory ArticleModel.fromJson(Map news)
  {
    
    return ArticleModel(
      author: news['author'],description: news['description'],title: news['title'],
      content: news['content'],imgUrl: news['urlToImage'],publish: news['publishedAt'], url: news['url'],
      sourceModel:SourceModel.fromJson(news["source"]),

    );
  }
}

class SourceModel
{
  String? id, name;
  SourceModel({this.id, this.name});

  factory SourceModel.fromJson(Map news)
  {
    return SourceModel(id: news['id'],name:news['name'] );
  }
}