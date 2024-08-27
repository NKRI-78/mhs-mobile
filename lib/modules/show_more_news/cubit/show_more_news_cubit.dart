import 'dart:async';

import 'package:equatable/equatable.dart';

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

  Future<void> fetchNews() async {
    try {
      var value = await homeRepo.getNews();
      var list = value.list;
      var pagination = value.pagination;

      emit(state.copyWith(news: list, newsPagination: pagination, loadingNews: false));
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(loadingNews: false));
    }
  }
}
