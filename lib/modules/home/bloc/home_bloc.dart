import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeInitialData>(_onHomeInitialData);
  }

  FutureOr<void> _onHomeInitialData(
      HomeInitialData event, Emitter<HomeState> emit) async {
    try {} catch (e) {
      ///
    }
  }
}
