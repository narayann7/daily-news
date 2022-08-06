import 'dart:developer';

import 'package:daily_news/controller/home_cubit.dart';
import 'package:daily_news/model/home_state.dart';
import 'package:daily_news/utility/constants.dart';
import 'package:daily_news/view/common_ui.dart';
import 'package:daily_news/view/loading_shimmer.dart';
import 'package:flutter/material.dart';
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
          scrollController.position.maxScrollExtent) {}
      if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        log("minnn");
      }
    });
  }

  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async {}),
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
                itemCount: state.newsData.articles!.length,
                itemBuilder: (BuildContext context, int index) {
                  return NewsCard(context, state.newsData.articles![index]);
                },
              );
            } else {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
          },
        ));
  }
}
