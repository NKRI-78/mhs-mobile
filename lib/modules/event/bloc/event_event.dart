part of 'event_bloc.dart';

sealed class EventEvent {
  const EventEvent();
}

final class EventInitial extends EventEvent {}

final class EventUpdateSelectedDate extends EventEvent {
  final DateTime selectedDateParam;

  EventUpdateSelectedDate({required this.selectedDateParam});
}

final class EventAddSelectedEvents extends EventEvent {
  final List<Map<String, dynamic>> events;

  EventAddSelectedEvents({required this.events});
}

final class EventCopyState extends EventEvent {
  final EventState newState;

  EventCopyState({required this.newState});
}