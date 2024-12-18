import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/pagination.dart';
import 'package:mhs_mobile/repositories/app_repository/models/profile_model.dart';
import 'package:mhs_mobile/repositories/home_repository/home_repository.dart';
import 'package:mhs_mobile/repositories/home_repository/models/banner_model.dart';
import 'package:mhs_mobile/repositories/home_repository/models/message_home_model.dart';
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
    on<GetMessageHome>(_onGetMessageHome);
    on<SetFcm>(_onSetFcm);
    on<GetCounNotif>(_onGetCountNotif);
    on<DeleteFcm>(_onDeleteFcm);
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
    add(GetMessageHome());
    add(GetTestimoni());
    add(GetCounNotif());
    add(SetFcm());
  }

  FutureOr<void> _onGetNews(GetNews event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(loadingNew: true));
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
      emit(state.copyWith(loadingBanner: true));
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
      emit(state.copyWith(loadingTestimoni: true));
      var value = await homeRepo.getTestimoni();
      var list = value;

      emit(state.copyWith(testimoni: list, loadingTestimoni: false));
    } catch (e) {
      emit(state.copyWith(loadingTestimoni: false));
      throw "Ada masalah pada server";
      //
    }
  }

  Future<void> _onSetFcm(SetFcm event,Emitter<HomeState> emit) async {
    try {
      if (Platform.isIOS) {
        await Future<void>.delayed(
          const Duration(
            seconds: 3,
          ),
        );
        await FirebaseMessaging.instance.getAPNSToken();
      }
      final token = await FirebaseMessaging.instance.getToken();

      await homeRepo.setFcm(token ?? '');
      debugPrint("Set FCM Success");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> setDelete(Emitter<HomeState> emit) async {
    try {
      final token = await FirebaseMessaging.instance.getToken();

      await homeRepo.setFcm(token ?? '');
    } catch (e) {
      debugPrint(e.toString());
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

  FutureOr<void> _onGetMessageHome(GetMessageHome event, Emitter<HomeState> emit) async {
    try {
      MessageHomeModel? data = await homeRepo.getMessageHome();
      emit(state.copyWith(message: data));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      emit(state.copyWith(loadingMessage: false));
    }
  }

  FutureOr<void> _onDeleteFcm(DeleteFcm event, Emitter<HomeState> emit) async {
    try {
      await homeRepo.setDeleteFcm();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  FutureOr<void> _onGetCountNotif(GetCounNotif event, Emitter<HomeState> emit) async {
    try {
      var countNotif = await homeRepo.getCountNotif();
      emit(state.copyWith(countNotif: countNotif));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
