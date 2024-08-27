part of 'event_detail_cubit.dart';

final class EventDetailState {
  final String idEvent;
  final EventDetailModel? event;
  final bool loading;


  const EventDetailState({
    this.idEvent = '',
    this.event,
    this.loading = false,
  });

  EventDetailState copyWith({
    String? idEvent,
    EventDetailModel? event,
    bool? loading,
  }) {
    return EventDetailState(
      idEvent: idEvent ?? this.idEvent,
      event: event ?? this.event,
      loading: loading ?? this.loading,
    );
  }
}