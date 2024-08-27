part of 'event_bloc.dart';

@JsonSerializable()
class EventState extends Equatable {
  final List<EventResult> event;
  final int nextPageEvent;
  final bool loading;
  final List<Map<String, dynamic>> events;
  final DateTime? selectedDateParam;

  const EventState({
    this.event = const [],
    this.nextPageEvent = 1,
    this.loading = false,
    this.events = const [],
    this.selectedDateParam,
  });

  @override
  List<Object?> get props => [
    event,
    nextPageEvent,
    loading,
    events,
    selectedDateParam,
  ];

  EventState copyWith({
    List<EventResult>? event,
    int? nextPageEvent,
    bool? loading,
    List<Map<String, dynamic>>? events,
    DateTime? selectedDateParam,
  }) {
    return EventState(
      event: event ?? this.event,
      nextPageEvent: nextPageEvent ?? this.nextPageEvent,
      loading: loading ?? this.loading,
      events: events ?? this.events,
      selectedDateParam: selectedDateParam ?? selectedDateParam,
    );
  }
}