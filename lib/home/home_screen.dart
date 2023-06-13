import 'package:flutter/material.dart';
import 'package:flutter_news_app_c8/category/category_details_screen.dart';
import 'package:flutter_news_app_c8/category/category_widget.dart';
import 'package:flutter_news_app_c8/home/home_drawer.dart';
import 'package:flutter_news_app_c8/model/category.dart';
import 'package:flutter_news_app_c8/my_theme.dart';
import 'package:flutter_news_app_c8/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: MyTheme.whiteColor,
        child: Image.asset(
          'assets/images/main_background.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'News App',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: HomeDrawer(onItemSideMenu: onItemSideMenuClicked),
        ),
        body: selectedItemDrawer == HomeDrawer.settings ?
            SettingsTab()
            :
        selectedCategory == null ?
            CategoryWidget(onCategoryItemClicked: onCategoryItemClicked)
            :
            CategoryDetails(category: selectedCategory!)
        ,

      ),
    ]);
  }

  Category? selectedCategory = null ;

  void onCategoryItemClicked(Category category){
    selectedCategory = category ;    /// sports
    setState(() {

    });
  }

  int selectedItemDrawer = HomeDrawer.categories ;
  void onItemSideMenuClicked(int newSelectedItemDrawer){
    selectedItemDrawer = newSelectedItemDrawer ;
    selectedCategory = null ;
    Navigator.pop(context);
    setState(() {

    });
  }
}
