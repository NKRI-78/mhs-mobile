import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/repositories/news_repository/models/detail_news_model.dart';
import 'package:mhs_mobile/repositories/news_repository/news_repository.dart';

part 'detail_news_state.dart';

class DetailNewsCubit extends Cubit<DetailNewsState> {
  DetailNewsCubit() : super(const DetailNewsState());
  
  NewsRepository repo = getIt<NewsRepository>();

  void copyState({required DetailNewsState newState}) {
    emit(newState);
  }

  Future<void> fetchDetailNews(int newsId) async {
    try {
      emit(state.copyWith(loading: true));
      final news = await repo.getDetailNews(newsId);
      emit(state.copyWith(news: news, idNews: newsId));
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

}