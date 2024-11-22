import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/modules/notification/bloc/notification_bloc.dart';
import 'package:mhs_mobile/repositories/notification_repository/model/detail_notification_model.dart';
import 'package:mhs_mobile/repositories/notification_repository/notification_repository.dart';

part 'detail_notification_state.dart';

class DetailNotificationCubit extends Cubit<DetailNotificationState>{
  DetailNotificationCubit() : super(const DetailNotificationState());

  NotificationRepository repo = getIt<NotificationRepository>();

  void copyState({required DetailNotificationState newState}) {
    emit(newState);
  }

  Future<void> fetchDetailNotif(int idNotif) async {
    try {
      emit(state.copyWith(loadingNotif: true));
      DetailNotifModel notif = await repo.detailNotification(id: idNotif);
      debugPrint("id notif fetch $idNotif");
      emit(state.copyWith(detailNotifModel: notif, idNotif: idNotif, loadingNotif: false));
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    }
  }

  @override
  Future<void> close() {
    if (getIt.isRegistered<NotificationBloc>()) {
      getIt<NotificationBloc>().add(NotifcationRefreshInfo());
      getIt<NotificationBloc>().add(NotifCount());
    }
    return super.close();
  }
}