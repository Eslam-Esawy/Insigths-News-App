import "package:flutter_svg/svg.dart";
import "package:flutter/material.dart";
import "package:insights_news_app/core/appcolors.dart";
import "package:insights_news_app/feature/news/widgets/News_list_view.dart";

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: DefaultTabController(
          length: 10,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.scaffoldBG,
              title: Text(
                'Find your news',
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 17.31,
                    fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchBar(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.containerBG),
                    hintText: 'Search for news',
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    leading: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/iconamoon_search-duotone.svg',
                        )),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Total Results: 10',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 11.54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  //Showing News
                  const Expanded(
                      child: TabBarView(children: [
                    NewsListViewWidget(),
                  ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
