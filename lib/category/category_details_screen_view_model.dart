import 'package:flutter/material.dart';
import 'package:flutter_news_app_c8/api_manager.dart';
import 'package:flutter_news_app_c8/model/SourceResponse.dart';

class CategoryDetailsScreenViewModel extends ChangeNotifier{
  // hold data , logic
  List<Source>? sourceList ;
  String? errorMessage ;

  void getSources(String categoryId)async{
    // reinitialize to return loading state
    errorMessage = null ;
    sourceList = null ;
    notifyListeners();
    try{
      var response = await ApiManager.getSources(categoryId);
      if(response.status == 'error'){
        errorMessage = response.message ;
      }else{
        sourceList = response.sources ;
      }
    }catch(e){
      print('error getting news sources');
      errorMessage = 'error getting news sources';
    }
    notifyListeners();
  }
}