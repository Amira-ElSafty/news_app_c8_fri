import 'package:flutter/material.dart';
import 'package:flutter_news_app_c8/api_manager.dart';
import 'package:flutter_news_app_c8/model/NewsResponse.dart';
import 'package:flutter_news_app_c8/model/SourceResponse.dart';
import 'package:flutter_news_app_c8/news/news_container_view_model.dart';
import 'package:flutter_news_app_c8/news/news_item.dart';
import 'package:provider/provider.dart';

class NewsContainer extends StatefulWidget {
  Source source ;
  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {

  NewsContainerViewModel viewModel = NewsContainerViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id!);
  }
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<NewsContainerViewModel>(
        create: (context) => viewModel ,
      child: Consumer<NewsContainerViewModel>(
        builder: (context,viewModel,child){
          if(viewModel.errorMessage != null){
            return Column(
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(onPressed: (){
                  viewModel.getNewsBySourceId(widget.source.id!);
                },
                    child: Text('Try again'))
              ],
            );
          }
          else if(viewModel.newsList == null){
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
          return ListView.builder(
                        itemBuilder: ((context, index) {
                          return NewsItem(news: viewModel.newsList![index]);
                        }),
                      itemCount:  viewModel.newsList?.length ?? 0,
                    );
                  })
              );


    //   FutureBuilder<NewsResponse>(
    //   future: ApiManager.getNews(widget.source.id ?? ''),
    //     builder: ((context, snapshot) {
    //       if(snapshot.connectionState == ConnectionState.waiting){
    //         return Center(
    //           child: CircularProgressIndicator(
    //               color: Theme.of(context).primaryColor),);
    //       } else if(snapshot.hasError){
    //          return Column(
    //           children: [
    //             Text('something went wrong'),
    //             ElevatedButton(onPressed: (){}, child: Text('Try Again'))
    //           ],
    //         );
    //       }
    //       if(snapshot.data?.status != 'ok'){
    //         return Column(
    //           children: [
    //             Text(snapshot.data?.message ?? ''),
    //             ElevatedButton(onPressed: (){}, child: Text('Try Again'))
    //           ],
    //         );
    //       }
    //       var newsList = snapshot.data?.articles ?? [] ;
    //       return ListView.builder(
    //           itemBuilder: ((context, index) {
    //             return NewsItem(news: newsList[index]);
    //           }),
    //         itemCount:  newsList.length,
    //       );
    //     })
    // );
  }
}
