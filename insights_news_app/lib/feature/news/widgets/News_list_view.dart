import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:insights_news_app/core/appcolors.dart';

class NewsListViewWidget extends StatelessWidget {
  const NewsListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          return Container(
            height: 90.73,
            width: 293.22,
            decoration: BoxDecoration(
              color: AppColors.containerBG,
              borderRadius: BorderRadius.circular(9.63),
            ),
            child: Row(
              children: [
                //The Image inside the news
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/image 2.jpg',
                    width: 127,
                    height: 90,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 20),

                //l ktaaba b2a
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Text(
                          'Man City stay perfect despite Rodri red against Forest',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/ci_hamburger.svg',
                            height: 18,
                            width: 18,
                          ),
                          const SizedBox(width: 2),
                          Text('Read',
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 17))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
