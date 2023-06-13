import 'package:flutter/material.dart';
import 'package:flutter_news_app_c8/model/category.dart';
import 'package:flutter_news_app_c8/my_theme.dart';

class CategoryItemWidget extends StatelessWidget {
  Category category;
  int index;
  CategoryItemWidget({required this.category, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: category.backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(index % 2 != 0 ? 20 : 0),
              bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0))),
      child: Column(
        children: [
          Image.asset(category.imagePath,
            height: 100,
          ),
          Text(category.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: MyTheme.whiteColor
            ),
          )
        ],
      ),
    );
  }
}
