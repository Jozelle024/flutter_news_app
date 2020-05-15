import 'package:flutter_news_app/models/article.dart';
import 'package:hive/hive.dart';
import '../main.dart';


class DbRepository {
  Box<Article> favoritesNews = Hive.box(NewsBox);

  addArticle(Article article){
    favoritesNews.put(article.id, article);
  }

  // per ottenere gli articoli
  List<Article> getArticles() => favoritesNews.values.toList();

  //ascolto articoli
  watch() => favoritesNews.watch();
}