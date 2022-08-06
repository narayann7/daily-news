import 'package:daily_news/model/news_data.dart';
import 'package:daily_news/utility/constants.dart';

class HomeState {
  NewsData newsData;
  int page;
  STATUS status;
  String error;
  bool isConnected;
  HomeState({
    required this.newsData,
    required this.page,
    required this.status,
    required this.error,
    required this.isConnected,
  });

  factory HomeState.initial() {
    return HomeState(
      newsData: NewsData.initial(),
      page: 0,
      status: STATUS.initial,
      error: "",
      isConnected: false,
    );
  }

  HomeState copyWith({
    NewsData? newsData,
    int? page,
    STATUS? status,
    String? error,
    bool? isConnected,
  }) {
    return HomeState(
      newsData: newsData ?? this.newsData,
      page: page ?? this.page,
      status: status ?? this.status,
      error: error ?? this.error,
      isConnected: isConnected ?? this.isConnected,
    );
  }
}
