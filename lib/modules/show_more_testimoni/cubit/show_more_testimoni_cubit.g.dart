// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_more_testimoni_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowMoreTestimoniState _$ShowMoreTestimoniStateFromJson(
        Map<String, dynamic> json) =>
    ShowMoreTestimoniState(
      testimoni: (json['testimoni'] as List<dynamic>?)
              ?.map((e) => TestimoniData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nextPageTestimoni: json['nextPageTestimoni'] as int? ?? 1,
      tstimoniPagination: json['tstimoniPagination'] == null
          ? null
          : Pagination.fromJson(
              json['tstimoniPagination'] as Map<String, dynamic>),
      loadingTestimoni: json['loadingTestimoni'] as bool? ?? false,
    );

Map<String, dynamic> _$ShowMoreTestimoniStateToJson(
        ShowMoreTestimoniState instance) =>
    <String, dynamic>{
      'testimoni': instance.testimoni,
      'nextPageTestimoni': instance.nextPageTestimoni,
      'tstimoniPagination': instance.tstimoniPagination,
      'loadingTestimoni': instance.loadingTestimoni,
    };
