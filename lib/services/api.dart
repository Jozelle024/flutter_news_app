import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_news_app/models/article.dart';

const String API = "https://newsapi.org/v2/";
const String TOKEN = "706f58ae3e4848d0954f764efe88682f";

class Api {
  final Dio dio = Dio();
  final DioCacheManager dioCache = DioCacheManager(CacheConfig(baseUrl: API));

  Api() {
    dio.options.baseUrl = API;
    dio.options.connectTimeout = 5000;
    dio.transformer = FlutterTransformer();
    if (!kIsWeb) dio.interceptors.add(dioCache.interceptor);

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      if (options.extra.isNotEmpty) {
        options.queryParameters.addAll(options.extra);
      }
      options.queryParameters['apiKey'] = TOKEN;
      options.queryParameters['country'] = "it";
      return options;
    }, onResponse: (Response response) async {
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) async {
      // Do something with response error
      return e; //continue
    }));
  }

  Future<List<Article>> fetchNewsList({String category, String query}) async {
    Response response = await dio.get('top-headlines',
            options: buildCacheOptions(Duration(seconds: 120)
            //options: Options(extra: createExtras(category, query))
            ));
    return response.data['articles']
        .map<Article>((json) => Article.fromJson(json))
        .toList();
  }

  Map<String, dynamic> createExtras(String category, String query) {
    LinkedHashMap<String, dynamic> map = LinkedHashMap();
    if (category != null) map['category'] = category;
    if (query != null) map['q'] = query;
    return map;
  }
}