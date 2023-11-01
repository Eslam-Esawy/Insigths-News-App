import "package:flutter/material.dart";
import "package:insights_news_app/core/appcolors.dart";

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Profile',
        style: TextStyle(fontSize: 60, color: AppColors.lemonade),
      )),
    );
  }
}
