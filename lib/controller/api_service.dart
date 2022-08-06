import 'dart:async';
import 'dart:convert';
import 'package:daily_news/model/news_data.dart';
import 'package:daily_news/utility/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<dynamic> getNews(int page) async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY&page=$page");
    try {
      var response = await http
          .get(
            url,
          )
          .timeout(const Duration(seconds: 60),
              onTimeout: () => throw TimeoutException('Connection Timed Out'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        NewsData newsData = NewsData.fromJson(jsonResponse);
        return newsData;
      }

      return "Something went wrong. Please try again later";
    } catch (e) {
      return e.toString();
    }
  }
}
