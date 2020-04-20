import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget{
  /* 
    final String title;
    NewsDetailScreen(this.title);
  */

  static const routeName = '/news-detail';
  @override
  Widget build(BuildContext context){
    //final String title = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('title')
      )
    );
  }
}