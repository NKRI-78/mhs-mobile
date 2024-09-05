import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/repositories/event_repository/event_repository.dart';
import 'package:mhs_mobile/repositories/event_repository/models/event_model.dart';
import 'package:mhs_mobile/repositories/home_repository/models/data_pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_state.dart';
part 'event_event.dart';
part 'event_bloc.g.dart';

class EventBloc extends HydratedBloc<EventEvent, EventState> {
  EventBloc() : super(const EventState()){
    on<EventInitial>(_onEventInitial);
    on<EventCopyState>(_onCopyState);
  }
  EventRepository repo =  getIt<EventRepository>();
  @override
  EventState? fromJson(Map<String, dynamic> json) {
    return _$EventStateFromJson(json);
  }
  
  @override
  Map<String, dynamic>? toJson(EventState state) {
    return _$EventStateToJson(state);
  }

  FutureOr<void> _onEventInitial(
      EventInitial event, Emitter<EventState> emit) async {
    // getIt<HomeBloc>().add(HomeReadAllEvent()); 
    // getIt<HomeBloc>().add(HomeRefreshForum()); 
    await Future.wait([
      fetchEvent(emit),
    ]);
  }

  FutureOr<void> _onCopyState(EventCopyState event, Emitter<EventState> emit) {
    emit(event.newState);
  }

  Future<void> fetchEvent(Emitter<EventState> emit) async {
    try {
      emit(state.copyWith(loading: true));
      DataPagination<EventResult> data = await repo.getEvents();
      emit(
        state.copyWith(event: data.list, nextPageEvent: data.paginate.next),
      );
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  @override
  Future<void> close() {
  
    debugPrint("Close Event");
    if (getIt.isRegistered<EventBloc>()) {
      getIt.unregister<EventBloc>();
    }
    return super.close();
  }
}

