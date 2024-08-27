part of 'app_bloc.dart';

sealed class AppEvent {
  const AppEvent();
}

final class FinishBeginingTour extends AppEvent {}

final class SetUserLogout extends AppEvent {}

final class SetAuthenticated extends AppEvent {
  final User user;
  final String token;

  SetAuthenticated({required this.user, required this.token});
}
