import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mhs_mobile/misc/pagination.dart';
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
  }

  static RefreshController notifRefreshCtrl = RefreshController();
  
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
    ]);
  }

  Future<void> fetchNotif(Emitter<NotificationState> emit) async {
    try {
      var value = await repo.getNotif();
      var list = value.list;
      var pagination = value.pagination;

      emit(state.copyWith(notif: list, pagination: pagination, loading: false));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchTransaction(Emitter<NotificationState> emit) async {
    try {
      var value = await repo.getTransaction();
      var list = value.list;
      var pagination = value.pagination;

      emit(state.copyWith(payment: list, pagination: pagination, loading: false));
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<void> close() {
    getIt.unregister<NotificationBloc>();
    return super.close();
  }
  
}