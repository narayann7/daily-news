import 'package:daily_news/controller/api_service.dart';
import 'package:daily_news/model/home_state.dart';
import 'package:daily_news/model/news_data.dart';
import 'package:daily_news/utility/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  getNews() async {
    try {
      emit(state.copyWith(status: STATUS.loading));
      var result = await ApiService.getNews(1);
      if (result is NewsData) {
        emit(state.copyWith(status: STATUS.success, page: 1, newsData: result));
      } else if (result is String) {
        emit(state.copyWith(status: STATUS.error, error: result));
      }
    } catch (e) {
      emit(state.copyWith(status: STATUS.error, error: e.toString()));
    }
  }

  getNextPageNews() async {
    if (state.status2 != STATUS.loading) {
      emit(state.copyWith(status2: STATUS.loading));

      try {
        var result = await ApiService.getNews(state.page + 1);
        if (result is NewsData) {
          var data = state.newsData.articles;

          for (var i = 0; i < result.articles!.length; i++) {
            data!.add(result.articles![i]);
          }
          state.newsData.articles = data;
          emit(state.copyWith(
              status2: STATUS.success,
              page: state.page + 1,
              newsData: state.newsData));
        } else if (result is String) {
          emit(state.copyWith(
            status2: STATUS.error,
          ));
        }
      } catch (e) {}
    }
  }
}
