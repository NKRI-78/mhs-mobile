import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mhs_mobile/misc/pagination.dart';
import 'package:mhs_mobile/repositories/home_repository/home_repository.dart';
import 'package:mhs_mobile/repositories/notification_repository/model/notificaiton_model.dart';
import 'package:mhs_mobile/repositories/notification_repository/model/transaction_model.dart';
import 'package:mhs_mobile/repositories/notification_repository/notification_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'notification_state.dart';
part 'notification_event.dart';
part 'notification_bloc.g.dart';

final repo = NotificationRepository();

class NotificationBloc extends HydratedBloc<NotificationEvent, NotificationState> {
  NotificationBloc()
      : super(
        NotificationState(pagination: Pagination.initial),
        ) {
    on<NotificationInitial>(_onNotificationInitial);
    on<NotificationCopyState>(_onCopyState);
    on<NotifcationRefreshInfo>(_onNotificationRefreshInfo);
    on<NotifRead>(_onNotifRead);
    on<NotifCount>(_onNotifCount);
    on<NotifLoadMore>(_onNotifLoadMore);
  }

  static RefreshController notifRefreshInfoCtrl = RefreshController();
  final homeRepo = HomeRepository();
  
  @override
  NotificationState? fromJson(Map<String, dynamic> json) {
    return _$NotificationStateFromJson(json);
  }
  
  @override
  Map<String, dynamic>? toJson(NotificationState state) {
    return _$NotificationStateToJson(state);
  }

  FutureOr<void> _onCopyState(NotificationCopyState event, Emitter<NotificationState> emit) {
    emit(event.newState);
  }

  FutureOr<void> _onNotificationInitial(NotificationInitial event, Emitter<NotificationState> emit) async {
    if (!getIt.isRegistered<NotificationBloc>()) {
      getIt.registerLazySingleton<NotificationBloc>(() => this);
    } else {
      getIt.unregister<NotificationBloc>();
      getIt.registerLazySingleton<NotificationBloc>(() => this);
    }
    await Future.wait([
      fetchNotif(emit),
      fetchTransaction(emit),
      fetchNotifCount(emit),
    ]);
  }

  Future<void> fetchNotif(Emitter<NotificationState> emit) async {
    try {
      var value = await repo.getNotif();
      var list = value.list;
      var pagination = value.pagination;
      debugPrint("Page Next : ${pagination.next}");

      emit(state.copyWith(notif: list, nextPageBroadcast: pagination.next, pagination: pagination),);
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    }
  }

  Future<void> fetchTransaction(Emitter<NotificationState> emit) async {
    try {
      var value = await repo.getTransaction();
      var list = value.list;
      var pagination = value.pagination;

      emit(state.copyWith(payment: list, pagination: pagination, loading: false, countTrasaction: value.list.length));
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    }
  }

  Future<void> fetchNotifCount(Emitter<NotificationState> emit) async {
    try {
      var countNotif = await homeRepo.getCountNotif();
      emit(state.copyWith(countNotif: countNotif));
      debugPrint("Now Count ${state.countNotif}");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  
  FutureOr<void> _onNotifCount(NotifCount event, Emitter<NotificationState> emit) async {
    try {
      var countNotif = await homeRepo.getCountNotif();
      emit(state.copyWith(countNotif: countNotif));
      debugPrint("Now Count ${state.countNotif}");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  
  @override
  Future<void> close() {
    getIt.unregister<NotificationBloc>();
    return super.close();
  }
  

  FutureOr<void> _onNotificationRefreshInfo(NotifcationRefreshInfo event, Emitter<NotificationState> emit) async {
    var value = await repo.getNotif();
    var list = value.list;
    var pagination = value.pagination;

    emit(state.copyWith(notif: list, pagination: pagination, loading: false));
    notifRefreshInfoCtrl.refreshCompleted();
  }

  FutureOr<void> _onNotifRead(NotifRead event, Emitter<NotificationState> emit) async {
    try {
      await repo.readNotif(idNotif: event.idNotif);
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  FutureOr<void> _onNotifLoadMore(NotifLoadMore event, Emitter<NotificationState> emit) async {
    try {
      var value = await repo.getNotif(page: state.nextPageBroadcast);
      var list = value.list;
      var pagination = value.pagination;
      
      emit(state.copyWith(
        notif: [...?state.notif, ...list], 
        nextPageBroadcast: pagination.next, 
        pagination: pagination));
    } catch (e) {
      debugPrint("error news $e");
    } finally {
      notifRefreshInfoCtrl.loadComplete();
    }
  }
}