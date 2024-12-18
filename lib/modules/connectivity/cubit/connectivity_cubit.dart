import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { initial, gained, lost }

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;

  InternetCubit() : super(InternetState.initial) {
    _checkConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.none)) {
        emit(InternetState.lost);
        log("check internet on change else called");
      } else {
        emit(InternetState.gained);
        log("check internet on change if called");
      }
    });
  }

  // New method to check initial connectivity status
  Future<void> _checkConnectivity() async {
    try {
      var connectivityResult = await _connectivity.checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(InternetState.lost);
        log("check internet initial else called");
      } else {
        emit(InternetState.gained);
        log("check internet initial if called");
      }
    } catch (e) {
      print("Error checking connectivity: $e");
      emit(InternetState.lost);
    }
  }


  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
