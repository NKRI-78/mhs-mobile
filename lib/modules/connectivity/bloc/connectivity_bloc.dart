import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'connectivity_event.dart';
import 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];

  ConnectivityBloc() : super(ConnectivityInitial()) {
    
    // Listen to connectivity changes
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      // Determine if there is an internet connection
      bool network = false;
      _connectionStatus = result;
      if(result.contains(ConnectivityResult.none)){
        network = false;
      }
      debugPrint("Status Network $_connectionStatus");
      debugPrint("Status Network $network");
      // Add the ConnectivityChanged event
      add(ConnectivityChanged(network));
    });

    // Handle the ConnectivityChanged event
    on<ConnectivityChanged>((event, emit) {
      if (event.isConnected) {
        emit(ConnectivitySuccess(event.isConnected));
      } else {
        emit(ConnectivityFailure());
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}