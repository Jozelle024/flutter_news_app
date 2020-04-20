import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/article.dart';
import 'package:flutter_news_app/services/api.dart' as api;

class News extends ChangeNotifier {
  final List<Article> _articles = [];

  News() {
    api.fetchNewsList().then((value) => 
      articles = value
      );
  }

  set articles(List<Article> news) {
    print(news);
    _articles.clear();
    _articles.addAll(news);
    notifyListeners();
  }

  List<Article> get articles => _articles;

}
