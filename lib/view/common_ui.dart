import 'package:daily_news/utility/common_function.dart';
import 'package:daily_news/utility/constants.dart';
import 'package:flutter/material.dart';

Widget NewCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    child: Stack(
      children: [
        Container(
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
                    children: [
                      myText(
                          size: 12,
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
  );
}
