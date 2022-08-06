import 'dart:developer';

import 'package:daily_news/controller/hive_db.dart';
import 'package:daily_news/controller/home_cubit.dart';
import 'package:daily_news/model/home_state.dart';
import 'package:daily_news/utility/common_function.dart';
import 'package:daily_news/utility/constants.dart';
import 'package:daily_news/view/common_ui.dart';
import 'package:daily_news/view/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    context.read<HomeCubit>().getNews();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await context.read<HomeCubit>().getNextPageNews();
      }
    });
  }

  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();

        return false;
      },
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
            children: [
              FloatingActionButton(onPressed: () async {
                var data = await AppHiveDb.getAllData();
                log(data.toString());
                // log(jsonDecode(data[0].toString()).toString());
                // NewsData newsData =
                //     NewsData.fromJson(jsonDecode(data[0].toString()));
                // log(newsData.toString());
                // data = data.toString().replaceAll('(', '').replaceAll(')', '');
                // log(jsonDecode(data).toString());
              }),
              FloatingActionButton(onPressed: () async {}),
            ],
          ),
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
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.status == STATUS.loading) {
                return const LoadingShimmer();
              } else if (state.status == STATUS.success) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  controller: scrollController,
                  itemCount: state.newsData.articles!.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index <= state.newsData.articles!.length - 1) {
                      return NewsCard(context, state.newsData.articles![index]);
                    } else {
                      return state.status2 == STATUS.loading
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                      "assets/loading.gif",
                                      height: 125.0,
                                      width: 125.0,
                                    )),
                              ))
                          : Container();
                    }
                  },
                );
              } else if (state.status == STATUS.no_data) {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Center(
                      child: myText(
                    "no cached data found, \nconnect to internet\nand try again",
                  )),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Center(
                      child: myText(
                    "Something went wrong, \nplease try again later",
                  )),
                );
              }
            },
          )),
    );
  }
}
