// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_modul_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListModulState _$ListModulStateFromJson(Map<String, dynamic> json) =>
    ListModulState(
      document: (json['document'] as List<dynamic>?)
              ?.map((e) => DocumentData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nextPageNews: json['nextPageNews'] as int? ?? 1,
      newsPagination: json['newsPagination'] == null
          ? null
          : Pagination.fromJson(json['newsPagination'] as Map<String, dynamic>),
      loadingModul: json['loadingModul'] as bool? ?? false,
    );

Map<String, dynamic> _$ListModulStateToJson(ListModulState instance) =>
    <String, dynamic>{
      'document': instance.document,
      'nextPageNews': instance.nextPageNews,
      'newsPagination': instance.newsPagination,
      'loadingModul': instance.loadingModul,
    };
