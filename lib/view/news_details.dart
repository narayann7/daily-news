import 'package:daily_news/utility/common_function.dart';
import 'package:daily_news/utility/constants.dart';
import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key}) : super(key: key);
  static const String routeName = '/NewsDetails';

  static getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/NewsDetails"),
        builder: (c) {
          return const NewsDetails();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        // appBar: eventDetailsAppbar(),
        body: Hero(
            tag: "1234",
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      myCachedNetworkImage(
                          "https://i.ytimg.com/vi/__FXp-MiY1o/maxresdefault.jpg",
                          0),
                      Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              end: FractionalOffset.topCenter,
                              begin: FractionalOffset.bottomCenter,
                              colors: [
                                const Color(0xff000000).withOpacity(0.9),
                                const Color(0xff000000).withOpacity(0.85),
                                const Color(0xff000000).withOpacity(0.4),
                                const Color(0xff232323).withOpacity(0.2),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 42, left: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: black.withOpacity(0.7),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.5,
                    child: FutureBuilder(
                      future: waitABit(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, bottom: 100),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  myText(
                                      size: 29,
                                      maxLine: 3,
                                      "A comma-seperated string of  or blogs you want headlines from",
                                      color: white),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 16, top: 64),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        myText(
                                            size: 12,
                                            fontWeight: FontWeight.bold,
                                            "Source ",
                                            color: text),
                                        const SizedBox(width: 5),
                                        myText(
                                            size: 12, "10-9-22", color: text),
                                      ],
                                    ),
                                  ),
                                  myText(
                                      size: 14,
                                      maxLine: 20,
                                      "ua et voluptua lobortis volutpat et no lorem dolore justo diam diam dolor hendrerit rebum. Vel dolores tempor aliquyam eos rebum dolores ea accumsan gubergren ut amet consetetur clita dolore feugiat dolores. Sit sit eos amet. Nisl ipsum nostrud ut ut justo eum magna augue esse velit dolor vero ipsum. Lo",
                                      color: text2),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return const Center();
                        }
                      },
                    ))
              ],
            )));
  }
}
