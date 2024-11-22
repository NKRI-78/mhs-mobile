// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationState _$NotificationStateFromJson(Map<String, dynamic> json) =>
    NotificationState(
      scrollP: (json['scrollP'] as num?)?.toDouble() ?? 0,
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      notif: (json['notif'] as List<dynamic>?)
              ?.map((e) => NotifData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      payment: (json['payment'] as List<dynamic>?)
              ?.map((e) => PaymentData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      detailNotif: json['detailNotif'] == null
          ? null
          : DetailNotifModel.fromJson(
              json['detailNotif'] as Map<String, dynamic>),
      tabIndex: json['tabIndex'] as int? ?? 0,
      countNotif: json['countNotif'] as int? ?? 0,
      countTrasaction: json['countTrasaction'] as int? ?? 1,
      idNotif: json['idNotif'] as int? ?? 0,
      loading: json['loading'] as bool? ?? true,
      nextPageBroadcast: json['nextPageBroadcast'] as int? ?? 0,
    );

Map<String, dynamic> _$NotificationStateToJson(NotificationState instance) =>
    <String, dynamic>{
      'scrollP': instance.scrollP,
      'pagination': instance.pagination,
      'notif': instance.notif,
      'payment': instance.payment,
      'detailNotif': instance.detailNotif,
      'tabIndex': instance.tabIndex,
      'countNotif': instance.countNotif,
      'countTrasaction': instance.countTrasaction,
      'idNotif': instance.idNotif,
      'loading': instance.loading,
      'nextPageBroadcast': instance.nextPageBroadcast,
    };
