import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';


class NewsService {
  final dio = Dio();

  Future<List<ArticleModel>> getNew(String category) async {
    var response = await dio.get(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=8d3f1c6bf00f4552928657d5e97d0c3e&category=$category",
    );
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'] ;
    List<ArticleModel> articlesList = [];
    for (var article in articles) {
      ArticleModel art = ArticleModel(
        author: article['author']??"unknown",
        title: article['title']??"not found",
        description: article['description'] ?? "not found",
        url: article['url']??"not found",
        urlToImage: article['urlToImage']??"https://www.shutterstock.com/shutterstock/photos/2263229465/display_1500/stock-vector-not-found-no-result-image-concept-illustration-flat-design-vector-eps-modern-graphic-element-2263229465.jpg",
        publishedAt: article['publishedAt']??"not found",
      );
      articlesList.add(art);
    }
    log(articlesList.toString());
    return articlesList;
  }
}
