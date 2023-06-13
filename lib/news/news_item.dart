import 'package:flutter/material.dart';
import 'package:flutter_news_app_c8/model/NewsResponse.dart';
import 'package:flutter_news_app_c8/my_theme.dart';

class NewsItem extends StatelessWidget {
  News news ;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 220,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Image.network(news.urlToImage ?? '',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Text(news.author ??'',
            style: TextStyle(
              fontSize: 12,
              color: MyTheme.greyColor
            ),
          ),
          Text(news.title ??'',
            style: TextStyle(
              fontSize: 18,
              color: MyTheme.blackColor
            ),
          ),
          Text(news.publishedAt ??'',
            style: TextStyle(
              fontSize: 12,
              color: MyTheme.greyColor
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
