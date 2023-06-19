import 'package:flutter/material.dart';

import 'package:flutter_news_app_c8/category/category_details_screen_view_model.dart';
import 'package:flutter_news_app_c8/model/category.dart';
import 'package:flutter_news_app_c8/tabs/tab_container.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category_details';
  Category category ;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsScreenViewModel viewModel = CategoryDetailsScreenViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsScreenViewModel>(
        builder: (context,viewModel,child){
          if(viewModel.errorMessage != null){
            return Center(
              child: Column(
                children: [
                  Text(viewModel.errorMessage!),
                  ElevatedButton(onPressed: (){
                    viewModel.getSources(widget.category.id);
                  },
                      child: Text('Try again'))

                ],
              ),
            );
          }
          else if(viewModel.sourceList == null){
            return Center(
              child: Column(
                children: [
                  child!,
                  CircularProgressIndicator(),
                ],
              ),
            );
          } else{
            return Column(
              children: [
                child!,
                Expanded(child: TabContainer(sourcesList: viewModel.sourceList!)),
              ],
            );
          }
        },
        child: Text('header'),
      ),
    );


    //   FutureBuilder<SourceResponse>(
    //   future: ApiManager.getSources(widget.category.id),
    //     builder: ((context, snapshot) {
    //       if(snapshot.connectionState == ConnectionState.waiting){
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         );
    //       } else if(snapshot.hasError){
    //         /// catch
    //         return Column(
    //           children: [
    //             Text('something went wrong'),
    //             ElevatedButton(onPressed: (){}, child: Text('Try Again'))
    //           ],
    //         );
    //       }
    //       /// data
    //       if(snapshot.data?.status != 'ok'){   /// error
    //         /// server has got message , code
    //         return Column(
    //           children: [
    //             Text(snapshot.data?.message ?? ""),
    //             ElevatedButton(onPressed: (){}, child: Text('Try Again'))
    //           ],
    //         );
    //       }
    //       /// data  sources
    //       var sourcesList = snapshot.data?.sources ?? [] ;
    //       return TabContainer(sourcesList: sourcesList,);
    //     })
    // );
  }
}

