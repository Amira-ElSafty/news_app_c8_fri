import 'package:flutter/material.dart';
import 'package:flutter_news_app_c8/model/SourceResponse.dart';
import 'package:flutter_news_app_c8/my_theme.dart';

class TabItem extends StatelessWidget {
  Source source ;
  bool isSelected ;
  TabItem({required this.source, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      margin: EdgeInsets.only(top: 15, bottom: 15
      ),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Theme.of(context).primaryColor)
      ),
      child: Text(source.name ?? '',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: isSelected ? MyTheme.whiteColor : Theme.of(context).primaryColor
        ),
      ),
    );
  }
}
