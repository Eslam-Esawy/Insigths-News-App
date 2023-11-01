import 'package:flutter/material.dart';
import 'package:insights_news_app/splash_view.dart';
import 'package:insights_news_app/core/appcolors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldBG,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: AppColors.grey),
              prefixIconColor: AppColors.lemonade,
              suffixIconColor: AppColors.lemonade,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.lemonade)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.lemonade)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.lemonade)),
            )),
        debugShowCheckedModeBanner: false,
        home: const SplashView());
  }
}
