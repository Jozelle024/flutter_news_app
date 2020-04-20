import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_news_app/provider/news.dart';



class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<News>(context);
    var newsList = newsProvider.articles;
    print(newsList);
    // newsList.length == 0 ? Container(child: new CircularProgressIndicator()) :
    return  
    GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 3/2, crossAxisSpacing: 10, mainAxisSpacing: 10), 
      itemCount: newsList.length,
      itemBuilder: (ctx,i) => 
        NewsItem(
          newsList[i].author, 
          newsList[i].title
        )
    );
  }
}

class NewsItem extends StatelessWidget {
  final String author;
  final String title;

  NewsItem(this.author, this.title);

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Text(this.title)
        /*GestureDetector(
        onTap: () {
          //Navigator.of(context).pushNamed('/news-detail', arguments: title);
        }),
         footer: Text(
          title, 
          style: TextStyle(fontSize: 16)
        ) */
    );
  }
}
