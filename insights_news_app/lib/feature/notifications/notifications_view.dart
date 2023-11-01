import "package:flutter/material.dart";
import "package:insights_news_app/core/appcolors.dart";

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Notification',
        style: TextStyle(fontSize: 60, color: AppColors.lemonade),
      )),
    );
  }
}
