import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/repositories/app_repository/app_repository.dart';
import 'package:mhs_mobile/repositories/app_repository/models/profile_model.dart';
import 'package:mhs_mobile/repositories/auth_repository/models/user/user.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.g.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  // Listen to connectivity changes

  AppBloc() : super(const AppState()) {
    on<FinishBeginingTour>(_onFinishBeginingTour);
    on<SetAuthenticated>(_onSetAuthenticated);
    on<SetUserLogout>(_onSetUserLogout);
    on<CheckConnectivity>(_onCheckConnectivity);
  }

  AppRepository repo = getIt<AppRepository>();

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

  FutureOr<void> _onSetUserLogout(SetUserLogout event, Emitter<AppState> emit) {
    emit(state.logout());
  }

  FutureOr<void> _onSetAuthenticated(
      SetAuthenticated event, Emitter<AppState> emit) {
    emit(state.copyWith(user: event.user, token: event.token));
  }

  FutureOr<void> _onCheckConnectivity(CheckConnectivity event, Emitter<AppState> emit) async {

  }
}
