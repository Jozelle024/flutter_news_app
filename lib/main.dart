import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_news_app/screen/news_list_screen.dart';
import 'package:flutter_news_app/provider/news.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => News(),
        child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => new NewsListScreen()
          //'/news-detail': (context) => NewsDetail()
        },
      ),
    );
  }
}
