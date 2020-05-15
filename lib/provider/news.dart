import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/article.dart';
import 'package:flutter_news_app/services/api.dart';

class News extends ChangeNotifier {
  final List<Article> _articles = [];
  final Map<String, List<Article>> _articlesMap = Map();

  News() {
    Api().fetchNewsList().then((value) => 
      articles = value
      );
  }

  set articles(List<Article> news) {
    print(news);
    _articles.clear();
    _articles.addAll(news);
    notifyListeners();
  }
  void addToArticlesMap(String key, List<Article> news) {
    assert(news != null);
    _articlesMap[key] = news;
    notifyListeners();
  }

  List<Article> getArticles(String category) => _articlesMap[category];
  List<Article> get articles => _articles;
}
