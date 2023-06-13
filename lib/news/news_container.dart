import 'package:flutter/material.dart';
import 'package:flutter_news_app_c8/api_manager.dart';
import 'package:flutter_news_app_c8/model/NewsResponse.dart';
import 'package:flutter_news_app_c8/model/SourceResponse.dart';
import 'package:flutter_news_app_c8/news/news_item.dart';

class NewsContainer extends StatelessWidget {
  Source source ;
  NewsContainer({required this.source});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(source.id ?? ''),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),);
          } else if(snapshot.hasError){
             return Column(
              children: [
                Text('something went wrong'),
                ElevatedButton(onPressed: (){}, child: Text('Try Again'))
              ],
            );
          }
          if(snapshot.data?.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data?.message ?? ''),
                ElevatedButton(onPressed: (){}, child: Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [] ;
          return ListView.builder(
              itemBuilder: ((context, index) {
                return NewsItem(news: newsList[index]);
              }),
            itemCount:  newsList.length,
          );
        })
    );
  }
}
