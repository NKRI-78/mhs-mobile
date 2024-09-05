part of 'home_bloc.dart';

sealed class HomeEvent {}

class HomeInitialData extends HomeEvent {}

class GetNews extends HomeEvent {}

class GetBanners extends HomeEvent {}

class SetProfileNull extends HomeEvent {}

class GetProfile extends HomeEvent {}

class GetTestimoni extends HomeEvent {}
