import "package:flutter/material.dart";
import "package:insights_news_app/core/appcolors.dart";
import "package:insights_news_app/feature/news/news_view.dart";
import "package:insights_news_app/feature/search/search_view.dart";
import 'package:insights_news_app/feature/profile/profile_view.dart';
import "package:insights_news_app/feature/notifications/notifications_view.dart";

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int cuurentIndex = 0;
  List<Widget> screens = [
    const NewsView(),
    const SearchView(),
    const NotificationsView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[cuurentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cuurentIndex,
          onTap: (value) {
            setState(() {
              cuurentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.scaffoldBG,
          selectedItemColor: AppColors.lemonade,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notifications'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],

          // items: [
          //   BottomNavigationBarItem(

          //       //Home Icon
          //       icon: Image.asset(
          //         'assets/Group.svg',
          //         width: 19.573,
          //         height: 21.151,
          //       ),
          //       label: 'Home'),

          //   //Search Icon
          //   BottomNavigationBarItem(
          //       icon: Image.asset(
          //         'assets/iconamoon:search-duotone.svg',
          //         width: 17,
          //         height: 17,
          //       ),
          //       label: 'Search'),

          //   //Notification Icon
          //   BottomNavigationBarItem(
          //       icon: Image.asset(
          //         'assets/Notification.svg',
          //         width: 17.305,
          //         height: 17.305,
          //       ),
          //       label: 'Notification'),

          //   //Profile Icon
          //   BottomNavigationBarItem(
          //       icon: Image.asset(
          //         'assets/Profile.svg',
          //         width: 18.266,
          //         height: 18.266,
          //       ),
          //       label: 'Profile'),
          // ]),
        ));
  }
}
