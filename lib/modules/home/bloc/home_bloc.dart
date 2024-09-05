import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/pagination.dart';
import 'package:mhs_mobile/repositories/app_repository/models/profile_model.dart';
import 'package:mhs_mobile/repositories/home_repository/home_repository.dart';
import 'package:mhs_mobile/repositories/home_repository/models/banner_model.dart';
import 'package:mhs_mobile/repositories/home_repository/models/news_model.dart';
import 'package:mhs_mobile/repositories/home_repository/models/testimoni_model.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(paginationNews: Pagination.initial)) {
    on<HomeInitialData>(_onHomeInitialData);
    on<GetProfile>(_onGetProfile);
    on<GetNews>(_onGetNews);
    on<GetBanners>(_onGetBanners);
    on<SetProfileNull>(_onSetProfileNull);
    on<GetTestimoni>(_onGetTestimoni);
  }

  final homeRepo = HomeRepository();

  FutureOr<void> _onHomeInitialData(
      HomeInitialData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loadingProfile: true));
    if (!getIt.isRegistered<HomeBloc>()) {
      getIt.registerLazySingleton<HomeBloc>(() => this);
    }
    add(GetNews());
    add(GetBanners());
    add(GetProfile());
    add(GetTestimoni());
  }

  FutureOr<void> _onGetNews(GetNews event, Emitter<HomeState> emit) async {
    try {
      var value = await homeRepo.getNews();
      var list = value.list;
      var pagination = value.pagination;

      emit(state.copyWith(
          news: list, paginationNews: pagination, loadingNew: false));
    } catch (e) {
      emit(state.copyWith(loadingNew: false));
      //
    }
  }

  FutureOr<void> _onGetBanners(
      GetBanners event, Emitter<HomeState> emit) async {
    try {
      var value = await homeRepo.getBanners();
      var list = value;

      emit(state.copyWith(banners: list, loadingBanner: false));
    } catch (e) {
      emit(state.copyWith(loadingBanner: false));
      //
    }
  }

  FutureOr<void> _onGetTestimoni(
      GetTestimoni event, Emitter<HomeState> emit) async {
    try {
      var value = await homeRepo.getTestimoni();
      var list = value;

      emit(state.copyWith(testimoni: list, loadingBanner: false));
    } catch (e) {
      emit(state.copyWith(loadingBanner: false));
      //
    }
  }

  FutureOr<void> _onGetProfile(
      GetProfile event, Emitter<HomeState> emit) async {
    try {
      ProfileModel? data = await homeRepo.getProfile();
      emit(state.copyWith(profile: data));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      emit(state.copyWith(loadingProfile: false));
    }
  }

  FutureOr<void> _onSetProfileNull(
      SetProfileNull event, Emitter<HomeState> emit) {
    emit(state.setProfileNull());
  }
}
