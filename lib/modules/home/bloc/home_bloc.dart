import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/pagination.dart';
import 'package:mhs_mobile/repositories/home_repository/home_repository.dart';
import 'package:mhs_mobile/repositories/home_repository/models/news_model.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(paginationNews: Pagination.initial)) {
    on<HomeInitialData>(_onHomeInitialData);
    on<GetNews>(_onGetNews);
    on<GetBanners>(_onGetBanners);
  }

  final homeRepo = HomeRepository();

  FutureOr<void> _onHomeInitialData(
      HomeInitialData event, Emitter<HomeState> emit) async {
    add(GetNews());
    add(GetBanners());
  }

  FutureOr<void> _onGetNews(GetNews event, Emitter<HomeState> emit) async {
    try {
      var value = await homeRepo.getNews();
      var list = value.list;
      var pagination = value.pagination;

      emit(state.copyWith(news: list, paginationNews: pagination));
    } catch (e) {
      //
    }
  }

  FutureOr<void> _onGetBanners(GetBanners event, Emitter<HomeState> emit) {}
}
