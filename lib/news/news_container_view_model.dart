import 'package:flutter/material.dart';
import 'package:flutter_news_app_c8/api_manager.dart';
import 'package:flutter_news_app_c8/model/NewsResponse.dart';

class NewsContainerViewModel extends ChangeNotifier{
  // store data
  // call api
  List<News>? newsList ;
  String? errorMessage ;

  void getNewsBySourceId(String sourceId)async{
    errorMessage = null ;
    newsList = null ;
    notifyListeners();
    try{
      var response = await ApiManager.getNews(sourceId);

      if(response.status == 'error'){
        errorMessage = response.message ;
      }else {
        newsList = response.articles ;
      }
    }catch(e){
      errorMessage = 'error loading news list';
    }
    notifyListeners();

  }
}