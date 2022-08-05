import 'package:daily_news/utility/common_function.dart';
import 'package:daily_news/utility/coustom_routes.dart';
import 'package:daily_news/view/home.dart';
import 'package:flutter/material.dart';

void main() async {
  mainInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.routeName,
      onGenerateRoute: CustomRoutes.generateRoute,
    );
  }
}
