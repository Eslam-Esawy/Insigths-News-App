import "widgets/News_list_view.dart";
import "package:flutter/material.dart";
import "package:buttons_tabbar/buttons_tabbar.dart";
import 'package:carousel_slider/carousel_slider.dart';
import "package:insights_news_app/core/appcolors.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Eslam',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 17.305,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 1.73),
                        const Text(
                          'Have a nice day',
                          style: TextStyle(
                              color: Color(0xff858585),
                              fontSize: 11.537,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 21.5,
                      backgroundColor: AppColors.white,

                      //dah b2a child 3shan a3ml sora tanya foo2 l soora elly mahtoota dy
                      //ya3ny foo2 l gholaaf l abyad dah
                      child: const CircleAvatar(
                        radius: 19.5,
                        backgroundImage: AssetImage('assets/Esawy.jpg'),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24.27),
                CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/image 2.jpg',
                      fit: BoxFit.fill,
                      height: 139,
                      width: 290,
                    ),
                  ),
                  options: CarouselOptions(
                    height: 150,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage:
                        true, // l soora dy akbar mn elly ganbohom
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                    //3shan ylf 3an taree2 l index
                    onPageChanged: (index, reason) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                  ),
                ),

                //l no2at elly taht l swar b2a
                const SizedBox(height: 10),
                SmoothPageIndicator(
                    controller: PageController(
                        initialPage: _pageIndex), // PageController
                    count: 5,
                    effect: ScrollingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: AppColors.lemonade,
                    ), // your preferred effect
                    onDotClicked: (index) {}),
                const SizedBox(height: 15),

                ButtonsTabBar(
                    // Customize the appearance and behavior of the tab bar

                    backgroundColor: AppColors.lemonade,
                    unselectedBackgroundColor: AppColors.containerBG,
                    borderWidth: 2,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    borderColor: AppColors.containerBG,
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                    unselectedLabelStyle: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    // Add your tabs here
                    tabs: const [
                      Tab(text: 'Science'),
                      Tab(text: 'Entertainment'),
                      Tab(text: 'Sports'),
                      Tab(text: 'Business'),
                    ]),

                const Expanded(
                    child: TabBarView(children: [
                  NewsListViewWidget(),
                  NewsListViewWidget(),
                  NewsListViewWidget(),
                  NewsListViewWidget(),
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
