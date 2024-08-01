import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/repositories/home_repository/home_repository.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeInitialData>(_onHomeInitialData);
  }

  final homeRepo = HomeRepository();

  FutureOr<void> _onHomeInitialData(
      HomeInitialData event, Emitter<HomeState> emit) async {
    try {
      homeRepo.getBanners().then((value) {
        /// here
      });

      homeRepo.getNews().then((value) {
        /// here
      });
    } catch (e) {
      ///
    }
  }
}
