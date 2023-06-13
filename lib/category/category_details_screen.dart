import 'package:flutter/material.dart';
import 'package:flutter_news_app_c8/api_manager.dart';
import 'package:flutter_news_app_c8/model/category.dart';
import 'package:flutter_news_app_c8/tabs/tab_container.dart';
import 'package:flutter_news_app_c8/model/SourceResponse.dart';

class CategoryDetails extends StatelessWidget {
  static const String routeName = 'category_details';
  Category category ;
  CategoryDetails({required this.category});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(category.id),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if(snapshot.hasError){
            /// catch
            return Column(
              children: [
                Text('something went wrong'),
                ElevatedButton(onPressed: (){}, child: Text('Try Again'))
              ],
            );
          }
          /// data
          if(snapshot.data?.status != 'ok'){   /// error
            /// server has got message , code
            return Column(
              children: [
                Text(snapshot.data?.message ?? ""),
                ElevatedButton(onPressed: (){}, child: Text('Try Again'))
              ],
            );
          }
          /// data  sources
          var sourcesList = snapshot.data?.sources ?? [] ;
          return TabContainer(sourcesList: sourcesList,);
        })
    );
  }
}
