import "package:flutter/material.dart";
import "package:insights_news_app/core/appcolors.dart";

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'News',
        style: TextStyle(fontSize: 60, color: AppColors.lemonade),
      )),
    );
  }
}
