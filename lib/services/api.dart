import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_news_app/models/article.dart';

Future<List<Article>> fetchNewsList() async {
  var client = new http.Client();
  try{
    final response = await client.get(
        'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=706f58ae3e4848d0954f764efe88682f');
    return await compute(parseArticleList, response.body);
  } catch(err){
    throw err;
  }
}

List<Article> parseArticleList(String responseBody) {
  final parsed = json.decode(responseBody)['articles'].cast<Map<String, dynamic>>();

  return parsed.map<Article>((json) => Article.fromJson(json)).toList();
}
