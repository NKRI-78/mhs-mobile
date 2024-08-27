// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventState _$EventStateFromJson(Map<String, dynamic> json) => EventState(
      event: (json['event'] as List<dynamic>?)
              ?.map((e) => EventResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nextPageEvent: json['nextPageEvent'] as int? ?? 1,
      loading: json['loading'] as bool? ?? false,
      events: (json['events'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      selectedDateParam: json['selectedDateParam'] == null
          ? null
          : DateTime.parse(json['selectedDateParam'] as String),
    );

Map<String, dynamic> _$EventStateToJson(EventState instance) =>
    <String, dynamic>{
      'event': instance.event,
      'nextPageEvent': instance.nextPageEvent,
      'loading': instance.loading,
      'events': instance.events,
      'selectedDateParam': instance.selectedDateParam?.toIso8601String(),
    };
