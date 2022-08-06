import 'package:daily_news/utility/common_function.dart';
import 'package:daily_news/utility/constants.dart';
import 'package:daily_news/view/news_details.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget NewsCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    child: GestureDetector(
      onTap: () {
        teleport(context, NewsDetails.routeName);
      },
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Hero(
              tag: "1234",
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        const Color(0xff000000).withOpacity(0.85),
                        const Color(0xff000000).withOpacity(0.4),
                        const Color(0xff232323).withOpacity(0.2),
                      ],
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(13)),
                child: myCachedNetworkImage(
                    "https://i.ytimg.com/vi/__FXp-MiY1o/maxresdefault.jpg", 2),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter,
                    colors: [
                      black.withOpacity(0.85),
                      black.withOpacity(0.4),
                      black.withOpacity(0.2),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(13)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myText(
                        size: 20,
                        maxLine: 3,
                        "A comma-seperated string of identifiers for the news sources or blogs you want headlines from",
                        color: text),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12, top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          myText(
                              size: 20,
                              fontWeight: FontWeight.bold,
                              "Source ",
                              color: text2),
                          const SizedBox(width: 5),
                          myText(size: 12, "10-9-22", color: text2),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

newsCardShimmer(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    child: Shimmer.fromColors(
      baseColor: Colors.grey[500] as Color,
      highlightColor: Colors.grey[100] as Color,
      enabled: true,
      child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          child: Container(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 8),
                          child: Container(
                            height: 16,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(color: Colors.amber[100]),
                          )),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 2, bottom: 20),
                          child: Container(
                            alignment: Alignment.center,
                            height: 16,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(color: Colors.amber[100]),
                          )),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          child: Container(
                            alignment: Alignment.center,
                            height: 16,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(color: Colors.amber[100]),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          )),
    ),
  );
}
