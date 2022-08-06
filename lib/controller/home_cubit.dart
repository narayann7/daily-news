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
        emit(state.copyWith(status: STATUS.success, newsData: result));
      } else if (result is String) {
        emit(state.copyWith(status: STATUS.error, error: result));
      }
    } catch (e) {
      emit(state.copyWith(status: STATUS.error, error: e.toString()));
    }
  }

  getNextPageNews() async {
    if (state.status != STATUS.loading2) {}
  }
}
