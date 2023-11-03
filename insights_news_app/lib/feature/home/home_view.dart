import "package:flutter_svg/svg.dart";
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
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
            //Home Icon
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Home.svg'),
              label: 'Home',
              activeIcon: SvgPicture.asset(
                'assets/Home.svg',
                colorFilter:
                    ColorFilter.mode(AppColors.lemonade, BlendMode.srcIn),
              ),
            ),

            //Search Icon
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/iconamoon_search-duotone.svg'),
                label: 'Search',
                activeIcon: SvgPicture.asset(
                  'assets/iconamoon_search-duotone.svg',
                  colorFilter:
                      ColorFilter.mode(AppColors.lemonade, BlendMode.srcIn),
                )),

            //Notification Icon
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/Notification.svg'),
                label: 'Notifications',
                activeIcon: SvgPicture.asset(
                  'assets/Notification.svg',
                  colorFilter:
                      ColorFilter.mode(AppColors.lemonade, BlendMode.srcIn),
                )),

            //Profile Icon
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Profile.svg'),
              label: 'Profile',
              activeIcon: SvgPicture.asset(
                'assets/Profile.svg',
                colorFilter:
                    ColorFilter.mode(AppColors.lemonade, BlendMode.srcIn),
              ),
            ),
          ]),
    );
  }
}
