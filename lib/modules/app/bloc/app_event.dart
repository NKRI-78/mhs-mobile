part of 'app_bloc.dart';

sealed class AppEvent {
  const AppEvent();
}

final class FinishBeginingTour extends AppEvent {}
