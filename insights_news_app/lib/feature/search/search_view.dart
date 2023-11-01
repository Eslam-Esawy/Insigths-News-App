import "package:flutter/material.dart";
import "package:insights_news_app/core/appcolors.dart";

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Search',
        style: TextStyle(fontSize: 60, color: AppColors.lemonade),
      )),
    );
  }
}
