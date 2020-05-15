import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_news_app/provider/news.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:flutter_news_app/news_bloc.dart';
import 'package:flutter_news_app/models/article.dart';

class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final newsProvider = Provider.of<News>(context);
    //var newsList = newsProvider.articles;
    // newsList.length == 0 ? Container(child: new CircularProgressIndicator()) :
    final bloc = Provider.of<NewsBloc>(context);
    bloc.getNews();
    return  
      DefaultTabController(
        length: 4, 
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter news App'),
            /* bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'General'),
                Tab(text: 'Business'),
                Tab(text: 'Entertainment'),
                Tab(text: 'Health')
              ]
              ) */
          ),
          body: SingleChildScrollView(
                    /* ResponsiveGridRow(
                      children: 
                      List.generate(newsList.length, (i){
                        return
                          ResponsiveGridCol(
                            md: 4,
                            xs: 12,
                          child: NewsItem(newsList[i].author, newsList[i].title, newsList[i].urlToImage)
                          );
                      })  */
                    child: Center(
                        child: StreamBuilder<List<Article>>(
                        stream: bloc.articles,
                        builder: (context, AsyncSnapshot<List<Article>> snapshot) {
                          if (snapshot.hasData) {
                              return
                                ResponsiveGridRow(
                                  children: List.generate(snapshot.data.length, (position){
                                    return ResponsiveGridCol( md: 4,xs: 12,
                                    child: NewsItem(snapshot.data[position])
                                  );
                                })
                              );  
                          } else return CircularProgressIndicator();
                        })
                    )
          )
        )
      );
  }
}

class NewsItem extends StatelessWidget {
  final Article article;  

  NewsItem(this.article);
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 200,
      width: 100,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: InkWell(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: this.article.urlToImage != null ? Image.network(
                        this.article.urlToImage,
                        height: 150,
                        fit: BoxFit.fill
                    ) : Container()
                  ),
                  Container(
                    child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                            this.article.title, 
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
