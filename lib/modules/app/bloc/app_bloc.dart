import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.g.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<FinishBeginingTour>(_onFinishBeginingTour);
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    return _$AppStateFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return _$AppStateToJson(state);
  }

  FutureOr<void> _onFinishBeginingTour(
      FinishBeginingTour event, Emitter<AppState> emit) {
    emit(state.copyWith(alreadyShowBeginingTour: true));
  }
}
