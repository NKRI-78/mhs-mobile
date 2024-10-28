// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) => AppState(
      alreadyShowBeginingTour:
          json['alreadyShowBeginingTour'] as bool? ?? false,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String? ?? '',
      isConnected: json['isConnected'] as bool? ?? true,
    );

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'alreadyShowBeginingTour': instance.alreadyShowBeginingTour,
      'user': instance.user,
      'token': instance.token,
      'isConnected': instance.isConnected,
    };
