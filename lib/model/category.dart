import 'package:flutter/material.dart';
import 'package:flutter_news_app_c8/my_theme.dart';

class Category {
  // data class or model
  String id;
  String title;
  String imagePath;
  Color backgroundColor;

  Category(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.backgroundColor});

  static List<Category> getCategory() {
    return [
      Category(
          id: 'sports',
          title: 'Sports',
          imagePath: 'assets/images/sports.png',
          backgroundColor: MyTheme.redColor),
      Category(
          id: 'technology',
          title: 'Technology',
          imagePath: 'assets/images/politics.png',
          backgroundColor: MyTheme.darkBlueColor),
      Category(
          id: 'health',
          title: 'Health',
          imagePath: 'assets/images/health.png',
          backgroundColor: MyTheme.pinkColor),
      Category(
          id: 'general',
          title: 'General',
          imagePath: 'assets/images/science.png',
          backgroundColor: MyTheme.yellowColor),
      Category(
          id: 'business',
          title: 'Business',
          imagePath: 'assets/images/bussines.png',
          backgroundColor: MyTheme.brownColor),
      Category(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: 'assets/images/environment.png',
          backgroundColor: MyTheme.blueColor),
      Category(
          id: 'science',
          title: 'Science',
          imagePath: 'assets/images/science.png',
          backgroundColor: MyTheme.yellowColor),
    ];
  }
}
