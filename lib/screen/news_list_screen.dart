import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_news_app/provider/news.dart';
import 'package:responsive_grid/responsive_grid.dart';


class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<News>(context);
    var newsList = newsProvider.articles;
    // newsList.length == 0 ? Container(child: new CircularProgressIndicator()) :
    return  SingleChildScrollView(
      child: ResponsiveGridRow(
          children: List.generate(newsList.length, (i){
            return
              ResponsiveGridCol(
                md: 3,
                xs: 6,
                child: NewsItem(newsList[i].author, newsList[i].title, newsList[i].urlToImage)
              );
          })
        )
    );
  }
}

class NewsItem extends StatelessWidget {
  final String author;
  final String title;
  final String image; 

  NewsItem(this.author, this.title, this.image);
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 200,
      width: 400,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: InkWell(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: this.image != null ? Image.network(
                        this.image,
                        height: 150,
                        fit: BoxFit.fill
                    ) : Container()
                  ),
                  Container(
                    child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                            this.title, 
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          )
                    )
                  ),
                ],
              ),
          )
        )
    );
  }
}
