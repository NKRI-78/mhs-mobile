part of 'notification_bloc.dart';

sealed class NotificationEvent {
  const NotificationEvent();
}

final class NotificationInitial extends NotificationEvent{}

final class NotifcationRefresh extends NotificationEvent{}

final class NotificationCopyState extends NotificationEvent {
  final NotificationState newState;

  NotificationCopyState({required this.newState});
}