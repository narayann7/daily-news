import 'package:daily_news/view/error.dart';
import 'package:daily_news/view/home.dart';
import 'package:daily_news/view/news_details.dart';
import 'package:flutter/material.dart';

class CustomRoutes {
  static Route generateRoute(RouteSettings routeSettings) {
    var args = routeSettings.arguments;

    switch (routeSettings.name) {
      case Home.routeName:
        return Home.getNavigator();
      case NewsDetails.routeName:
        return NewsDetails.getNavigator();

      default:
        return MaterialPageRoute(builder: (c) => const ErrorScreen());
    }
  }
}
