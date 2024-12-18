part of 'notification_bloc.dart';

sealed class NotificationEvent {
  const NotificationEvent();
}

final class NotificationInitial extends NotificationEvent{}

final class NotifcationRefreshInfo extends NotificationEvent{}

final class NotificationCopyState extends NotificationEvent {
  final NotificationState newState;

  NotificationCopyState({required this.newState});
}

final class NotificationDetail extends NotificationEvent { 
  final int id;

  NotificationDetail({required this.id}); 
}

final class NotifRead extends NotificationEvent { 
  final int idNotif;

  NotifRead({required this.idNotif}); 
}
final class NotifCount extends NotificationEvent{}
final class NotifLoadMore extends NotificationEvent{}