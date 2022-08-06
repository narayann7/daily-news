import 'dart:developer';

import 'package:daily_news/utility/constants.dart';
import 'package:daily_news/view/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String routeName = '/Home';

  static getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/Home"),
        builder: (c) {
          return const Home();
        });
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        log('scrollController.position.pixels == scrollController.position.maxScrollExtent');
      }
    });
  }

  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: black,
          title: Text(
            "HEADLINES",
            style: GoogleFonts.getFont("Roboto Slab",
                letterSpacing: 4,
                fontSize: 29,
                color: white,
                fontWeight: FontWeight.bold),
          ),
          leading: Container(),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [NewsCard(context), newsCardShimmer(context)],
          ),
        )

        //  ListView.builder(
        //   physics: const BouncingScrollPhysics(
        //       parent: AlwaysScrollableScrollPhysics()),
        //   controller: scrollController,
        //   itemCount: 20,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Container(
        //         alignment: Alignment.center,
        //         height: MediaQuery.of(context).size.height * 0.2,
        //         width: MediaQuery.of(context).size.width,
        //         decoration: BoxDecoration(color: Colors.amber[100]),
        //       ),
        //     );
        //   },
        // ),
        );
  }
}
