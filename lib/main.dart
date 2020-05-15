import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:flutter_news_app/google_map/googleMapExample.dart';
import 'package:flutter_news_app/screen/animations.dart';
import 'package:flutter_news_app/screen/bimby_ui.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_news_app/screen/news_list_screen.dart';
import 'package:flutter_news_app/news_bloc.dart';
import 'package:flutter_news_app/models/article.dart';



const String NewsBox = 'NewsBox';
void main() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ArticleAdapter());

    await Hive.openBox<Article>(NewsBox);

    GoogleMap.init('AIzaSyBZ9oUtEoNK46VA1MVJscikPnWVpvHiWj4');
    WidgetsFlutterBinding.ensureInitialized();


    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NewsBloc>(create: (_) => NewsBloc()),
      ],
      child: MaterialApp(
        title: 'FlutterNews App',
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => GoogleMapExample()
          //'/': (context) => Bimby(title: 'Bimby prova'),
//          '/fav': (context) => FavNews(),
//          '/search': (context) => Search(),
        },
      ),
    );
  }
}
