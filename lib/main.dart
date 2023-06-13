import 'package:flutter/material.dart';
import 'package:flutter_news_app_c8/category/category_details_screen.dart';
import 'package:flutter_news_app_c8/home/home_screen.dart';
import 'package:flutter_news_app_c8/my_theme.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.lightTheme,
    );
  }
}
