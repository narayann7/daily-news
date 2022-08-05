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
  @override
  void initState() {
    super.initState();
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
        body: Center(child: NewCard(context)));
  }
}
