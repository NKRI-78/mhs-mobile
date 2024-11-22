import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mhs_mobile/misc/pagination.dart';
import 'package:mhs_mobile/repositories/home_repository/home_repository.dart';
import 'package:mhs_mobile/repositories/home_repository/models/news_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'show_more_news_state.dart';
part 'show_more_news_cubit.g.dart';

class ShowMoreNewsCubit extends Cubit<ShowMoreNewsState> {
  ShowMoreNewsCubit() : super(const ShowMoreNewsState());

  final homeRepo = HomeRepository();

  static RefreshController newsRefreshCtrl = RefreshController();

  void copyState({required ShowMoreNewsState newState}) {
    emit(newState);
  }

  Future<void> onRefresh() async{
    var value = await homeRepo.getNews();
    var list = value.list;
    var pagination = value.pagination;

    emit(state.copyWith(news: list, nextPageNews: pagination.next, newsPagination: pagination),);
    newsRefreshCtrl.refreshCompleted();
  }

  Future<void> fetchNews() async {
    try {
      emit(state.copyWith(loadingNews: true));
      var value = await homeRepo.getNews();
      var list = value.list;
      var pagination = value.pagination;

      emit(state.copyWith(news: list, nextPageNews: pagination.next, newsPagination: pagination, loadingNews: false),);
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    } finally {
      emit(state.copyWith(loadingNews: false));
    }
  }

  FutureOr<void> loadMoreNews() async {
    try {
      var value = await homeRepo.getNews(page: state.nextPageNews);
      var list = value.list;
      var pagination = value.pagination;
      
      emit(state.copyWith(
        news: [...state.news, ...list], 
        nextPageNews: pagination.next, 
        newsPagination: pagination));
    } catch (e) {
      debugPrint("error news $e");
    } finally {
      newsRefreshCtrl.loadComplete();
    }
  }
}
