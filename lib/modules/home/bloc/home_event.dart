part of 'home_bloc.dart';

sealed class HomeEvent {}

class HomeInitialData extends HomeEvent {}

class GetNews extends HomeEvent {}

class GetBanners extends HomeEvent {}
