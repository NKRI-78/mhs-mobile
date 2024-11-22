part of 'detail_notification_cubit.dart';

final class DetailNotificationState {
  final int idNotif;
  final DetailNotifModel? detailNotifModel;
  final bool loadingNotif;

  const DetailNotificationState({
    this.idNotif = 0,
    this.detailNotifModel,
    this.loadingNotif = false,
  });

  DetailNotificationState copyWith({
    int? idNotif,
    DetailNotifModel? detailNotifModel,
    bool? loadingNotif,
  }) {
    return DetailNotificationState(
      idNotif: idNotif ?? this.idNotif,
      detailNotifModel: detailNotifModel ?? this.detailNotifModel,
      loadingNotif: loadingNotif ?? this.loadingNotif,
    );
  }
}